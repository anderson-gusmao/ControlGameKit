//
//  DeallocationTests.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 30/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import XCTest
import GameController
import Combine
@testable import ControlGameKit

@available(OSX 10.15, *)
class DeallocationTests: XCTestCase {

	var joystick: Joystick?

    func testDeinit() throws {
		joystick = Joystick()
		joystick = nil
		XCTAssertNil(joystick)
    }
}
