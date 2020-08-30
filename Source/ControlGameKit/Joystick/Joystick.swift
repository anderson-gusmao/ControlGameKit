//
//  Joystick.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation
import GameController
import Combine

@available(OSX 10.15, *)
final public class Joystick{

	public let dpad = JoystickDpad()
	public let thumbstick = JoystickThumbstick()
	public let buttons = JoystickButtons()
	public let link = JoystickLink()
	private let controllerType: AnyClass

	private struct Constant {
		static let onConnect = NSNotification.Name.GCControllerDidConnect
		static let onDisconnect = NSNotification.Name.GCControllerDidConnect
		static let notification = NotificationCenter.default
	}

	public init(controllerType: AnyClass = GCController.self) {
		self.controllerType = controllerType
		observe()
	}

	deinit {
		Constant.notification.removeObserver(self)
	}

	private func observe() {
		Constant.notification.addObserver(self, selector: #selector(connect), name: Constant.onConnect, object: nil)
		Constant.notification.addObserver(self, selector: #selector(disconnect), name: Constant.onDisconnect, object: nil)
	}

	@objc func connect() {
		var indexNumber = 0
		for controller in controllerType.controllers() {
			if controller.extendedGamepad != nil {
				guard let index = GCControllerPlayerIndex.init(rawValue: indexNumber) else { continue }
				controller.playerIndex = index
				setupControllerControls(controller: controller)
				indexNumber += 1
			}
		}
		link.onConnectSubject.send()
	}

	@objc func disconnect() {
		link.onDisconnectSubject.send()
	}

	func setupControllerControls(controller: GCController) {
		controller.extendedGamepad?.valueChangedHandler = { [weak self]
			(gamepad: GCExtendedGamepad, element: GCControllerElement)  in
			guard let self = self else { return }
			self.controllerInputDetected(gamepad: gamepad, element: element, index: controller.playerIndex.rawValue)
		}
	}

	func detectDirection(x: Double, y: Double, index: Int) -> DirectionalAction {
		if x > 0 && y == 0 { return .right(index, CGPoint(x: x, y: y)) }
		if x < 0 && y == 0 { return .left(index, CGPoint(x: x, y: y)) }
		if x == 0 && y > 0 { return .up(index, CGPoint(x: x, y: y)) }
		if x == 0 && y < 0 { return .down(index, CGPoint(x: x, y: y)) }

		if x > 0 && y > 0 { return .upRight(index, CGPoint(x: x, y: y)) }
		if x < 0 && y > 0 { return .upLeft(index, CGPoint(x: x, y: y)) }
		if x > 0 && y < 0 { return .downRight(index, CGPoint(x: x, y: y)) }
		if x < 0 && y < 0 { return .downLeft(index, CGPoint(x: x, y: y)) }
		return .center(index, CGPoint(x: x, y: y))
	}

	func controllerInputDetected(gamepad: GCExtendedGamepad, element: GCControllerElement, index: Int) {

		switch element {
		case gamepad.buttonA:
			let action: ButtonAction = gamepad.buttonA.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionASubject.send(action)
		case gamepad.buttonB:
			let action: ButtonAction = gamepad.buttonB.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionBSubject.send(action)
		case gamepad.buttonX:
			let action: ButtonAction = gamepad.buttonX.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionXSubject.send(action)
		case gamepad.buttonY:
			let action: ButtonAction = gamepad.buttonY.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionYSubject.send(action)
		case gamepad.dpad:
			let x = Double(gamepad.dpad.xAxis.value)
			let y = Double(gamepad.dpad.yAxis.value)
			dpad.subject.send(detectDirection(x: x, y: y, index: index))
		case gamepad.leftThumbstick:
			let x = Double(gamepad.leftThumbstick.xAxis.value)
			let y = Double(gamepad.leftThumbstick.yAxis.value)
			thumbstick.leftMoveSubject.send(detectDirection(x: x, y: y, index: index))
		case gamepad.rightThumbstick:
			let x = Double(gamepad.rightThumbstick.xAxis.value)
			let y = Double(gamepad.rightThumbstick.yAxis.value)
			thumbstick.rightMoveSubject.send(detectDirection(x: x, y: y, index: index))
		case gamepad.rightThumbstickButton:
			guard let isZero = gamepad.rightThumbstickButton?.value.isZero else { return }
			let action: ButtonAction = isZero ? .released(index) : .pressed(index, nil)
			thumbstick.rightPressSubject.send(action)
		case gamepad.leftThumbstickButton:
			guard let isZero = gamepad.leftThumbstickButton?.value.isZero else { return }
			let action: ButtonAction = isZero ? .released(index) : .pressed(index, nil)
			thumbstick.leftPressSubject.send(action)
		case gamepad.buttonMenu:
			let action: ButtonAction = gamepad.buttonMenu.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionMenuSubject.send(action)
		case gamepad.buttonOptions:
			guard let isZero = gamepad.buttonOptions?.value.isZero else { return }
			let action: ButtonAction = isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionOptionSubject.send(action)
		case gamepad.leftShoulder:
			let action: ButtonAction = gamepad.leftShoulder.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionLeftShoulderSubject.send(action)
		case gamepad.rightShoulder:
			let action: ButtonAction = gamepad.rightShoulder.value.isZero ? .released(index) : .pressed(index, nil)
			buttons.onActionRightShoulderSubject.send(action)
		case gamepad.leftTrigger:
			let value = gamepad.leftTrigger.value
			let action: ButtonAction = value.isZero ? .released(index) : .pressed(index, Double(value))
			buttons.onActionLeftTriggerSubject.send(action)
		case gamepad.rightTrigger:
			let value = gamepad.rightTrigger.value
			let action: ButtonAction = value.isZero ? .released(index) : .pressed(index, Double(value))
			buttons.onActionRightTriggerSubject.send(action)
		default:
			break
		}
	}
}
