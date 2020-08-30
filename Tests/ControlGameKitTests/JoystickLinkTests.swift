//
//  JoystickLinkTests.swift
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
class JoystickLinkTests: XCTestCase {

	private let joystick = Joystick(controllerType: GCControllerMock.self)
	private var cancellable: AnyCancellable?

    override func tearDownWithError() throws {
		cancellable?.cancel()
        cancellable = nil
    }

	func testConnection() throws {
		let expectationForConnection = XCTestExpectation(description: "Connected...")

		cancellable = joystick.link.onConnect.sink { _ in
			expectationForConnection.fulfill()
		}
		joystick.connect()

		wait(for: [expectationForConnection], timeout: 1.0)
    }

	func testDisconnection() throws {
		let expectationForDisconnection = XCTestExpectation(description: "Disconnected...")

		cancellable = joystick.link.onDisconnect.sink { _ in
			expectationForDisconnection.fulfill()
		}
		joystick.disconnect()

		wait(for: [expectationForDisconnection], timeout: 1.0)
    }
}
