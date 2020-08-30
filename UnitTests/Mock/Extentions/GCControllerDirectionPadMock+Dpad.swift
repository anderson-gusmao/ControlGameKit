//
//  GCControllerDirectionPadMock+Actions.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 30/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import GameController

extension GCControllerDirectionPadMock {

	func pressUp() {
		valueChangedHandler?(self, 0, 1)
	}

	func releaseUp() {
		valueChangedHandler?(self, 0, 0)
	}

	func pressDown() {
		valueChangedHandler?(self, 0, -1)
	}

	func releaseDown() {
		valueChangedHandler?(self, 0, 0)
	}

	func pressLeft() {
		valueChangedHandler?(self, -1, 0)
	}

	func releaseLeft() {
		valueChangedHandler?(self, 0, 0)
	}

	func pressRight() {
		valueChangedHandler?(self, 1, 0)
	}

	func releaseRight() {
		valueChangedHandler?(self, 0, 0)
	}
}
