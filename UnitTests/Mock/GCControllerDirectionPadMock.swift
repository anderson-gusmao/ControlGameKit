//
//  GCControllerDirectionPadMock.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 30/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import GameController

final class GCControllerDirectionPadMock: GCControllerDirectionPad {

	private let _xAxis = GCControllerAxisInput()
	private let _yAxis = GCControllerAxisInput()

    override var xAxis: GCControllerAxisInput { _xAxis }
    override var yAxis: GCControllerAxisInput { _yAxis }
}
