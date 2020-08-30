//
//  GCExtendedGamepadMock+ButtonsSimulation.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 30/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

extension GCExtendedGamepadMock {

	func pressButtonA() {
		buttonA.setValue(1.0)
		valueChangedHandler?(self, buttonA)
	}

	func releaseButtonA() {
		buttonA.setValue(0.0)
		valueChangedHandler?(self, buttonA)
	}

	func pressButtonB() {
		buttonB.setValue(1.0)
		valueChangedHandler?(self, buttonB)
	}

	func releaseButtonB() {
		buttonB.setValue(0.0)
		valueChangedHandler?(self, buttonB)
	}

	func pressButtonX() {
		buttonX.setValue(1.0)
		valueChangedHandler?(self, buttonX)
	}

	func releaseButtonX() {
		buttonX.setValue(0.0)
		valueChangedHandler?(self, buttonX)
	}

	func pressButtonY() {
		buttonY.setValue(1.0)
		valueChangedHandler?(self, buttonY)
	}

	func releaseButtonY() {
		buttonY.setValue(0.0)
		valueChangedHandler?(self, buttonY)
	}

	func pressButtonMenu() {
		buttonMenu.setValue(1.0)
		valueChangedHandler?(self, buttonMenu)
	}

	func releaseButtonMenu() {
		buttonMenu.setValue(0.0)
		valueChangedHandler?(self, buttonMenu)
	}

	func pressButtonOptions() {
		buttonOptions.setValue(1.0)
		valueChangedHandler?(self, buttonOptions)
	}

	func releaseButtonOptions() {
		buttonOptions.setValue(0.0)
		valueChangedHandler?(self, buttonOptions)
	}

	func pressButtonLeftTrigger(value: Float) {
		leftTrigger.setValue(value)
		valueChangedHandler?(self, leftTrigger)
	}

	func releaseButtonLeftTrigger() {
		leftTrigger.setValue(0.0)
		valueChangedHandler?(self, leftTrigger)
	}

	func pressButtonRightTrigger(value: Float) {
		rightTrigger.setValue(value)
		valueChangedHandler?(self, rightTrigger)
	}

	func releaseButtonRightTrigger() {
		rightTrigger.setValue(0.0)
		valueChangedHandler?(self, rightTrigger)
	}

	func pressButtonLeftShoulder() {
		leftShoulder.setValue(1.0)
		valueChangedHandler?(self, leftShoulder)
	}

	func releaseButtonLeftShoulder() {
		leftShoulder.setValue(0.0)
		valueChangedHandler?(self, leftShoulder)
	}

	func pressButtonRightShoulder() {
		rightShoulder.setValue(1.0)
		valueChangedHandler?(self, rightShoulder)
	}

	func releaseButtonRightShoulder() {
		rightShoulder.setValue(0.0)
		valueChangedHandler?(self, rightShoulder)
	}

	func pressButtonLeftThumbstick() {
		leftThumbstickButton.setValue(1.0)
		valueChangedHandler?(self, leftThumbstickButton)
	}

	func releaseButtonLeftThumbstick() {
		leftThumbstickButton.setValue(0.0)
		valueChangedHandler?(self, leftThumbstickButton)
	}

	func pressButtonRightThumbstick() {
		rightThumbstickButton.setValue(1.0)
		valueChangedHandler?(self, rightThumbstickButton)
	}

	func releaseButtonRightThumbstick() {
		rightThumbstickButton.setValue(0.0)
		valueChangedHandler?(self, rightThumbstickButton)
	}
}
