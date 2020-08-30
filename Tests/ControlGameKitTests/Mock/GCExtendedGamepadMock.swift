//
//  GCExtendedGamepadMock.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 29/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation
import GameController

final class GCExtendedGamepadMock: GCExtendedGamepad {

	private let _buttonA = GCControllerButtonInput()
	override var buttonA: GCControllerButtonInput { _buttonA }

	private let _buttonB = GCControllerButtonInput()
	override var buttonB: GCControllerButtonInput { _buttonB }

	private let _buttonX = GCControllerButtonInput()
	override var buttonX: GCControllerButtonInput { _buttonX }

	private let _buttonY = GCControllerButtonInput()
	override var buttonY: GCControllerButtonInput { _buttonY }

	private let _buttonMenu = GCControllerButtonInput()
	override var buttonMenu: GCControllerButtonInput { _buttonMenu }

	private let _buttonOptions = GCControllerButtonInput()
	override var buttonOptions: GCControllerButtonInput { _buttonOptions }

	private let _leftTrigger = GCControllerButtonInput()
	override var leftTrigger: GCControllerButtonInput { _leftTrigger }

	private let _rightTrigger = GCControllerButtonInput()
	override var rightTrigger: GCControllerButtonInput { _rightTrigger }

	private let _leftShoulder = GCControllerButtonInput()
	override var leftShoulder: GCControllerButtonInput { _leftShoulder }

	private let _rightShoulder = GCControllerButtonInput()
	override var rightShoulder: GCControllerButtonInput { _rightShoulder }

	private let _leftThumbstickButton = GCControllerButtonInput()
	override var leftThumbstickButton: GCControllerButtonInput { _leftThumbstickButton }

	private let _rightThumbstickButton = GCControllerButtonInput()
	override var rightThumbstickButton: GCControllerButtonInput { _rightThumbstickButton }

	private let _directional = GCControllerDirectionPadMock()
	private let _leftThumbstick = GCControllerDirectionPadMock()
	private let _rightThumbstick = GCControllerDirectionPadMock()

	override var dpad: GCControllerDirectionPad {
		if _directional.valueChangedHandler == nil {
			_directional.valueChangedHandler = dpadHandler
		}
		return _directional
	}

    override var leftThumbstick: GCControllerDirectionPad {
		if _leftThumbstick.valueChangedHandler == nil {
			_leftThumbstick.valueChangedHandler = dpadHandler
		}
		return _leftThumbstick
	}
    override var rightThumbstick: GCControllerDirectionPad {
		if _rightThumbstick.valueChangedHandler == nil {
			_rightThumbstick.valueChangedHandler = dpadHandler
		}
		return _rightThumbstick
	}

	private func dpadHandler(gcControllerDirectionPad: GCControllerDirectionPad, x: Float, y: Float) {
		gcControllerDirectionPad.xAxis.setValue(x)
		gcControllerDirectionPad.yAxis.setValue(y)
		valueChangedHandler?(self, gcControllerDirectionPad)
	}
}
