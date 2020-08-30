//
//  GCControllerMock.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 29/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import GameController

final class GCControllerMock: GCController {
	let gamePad = GCExtendedGamepadMock()

	override var isSnapshot: Bool { true }
	override var extendedGamepad: GCExtendedGamepad? { gamePad }
}
