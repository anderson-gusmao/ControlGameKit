//
//  ControlGameKitDirectionalTests.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 29/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import XCTest
import GameController
import Combine
@testable import ControlGameKit

@available(OSX 10.15, *)
class ControlGameKitDirectionalTests: XCTestCase {

    private let joystick = Joystick()
	private let controller = GCControllerMock()
	private var cancellable: AnyCancellable?

    override func setUpWithError() throws {
		controller.playerIndex = .index2
        joystick.setupControllerControls(controller: controller)
    }

    override func tearDownWithError() throws {
		cancellable?.cancel()
        cancellable = nil
    }

	func testDirections() throws {
		XCTAssertEqual(joystick.detectDirection(x: 0, y: 0, index: 0), DirectionalAction.center(0, CGPoint(x: 0, y: 0)))
		XCTAssertEqual(joystick.detectDirection(x: 0, y: 1, index: 0), DirectionalAction.up(0, CGPoint(x: 0, y: 1)))
		XCTAssertEqual(joystick.detectDirection(x: 0, y: -1, index: 0), DirectionalAction.down(0, CGPoint(x: 0, y: -1)))
		XCTAssertEqual(joystick.detectDirection(x: -1, y: 0, index: 0), DirectionalAction.left(0, CGPoint(x: -1, y: 0)))
		XCTAssertEqual(joystick.detectDirection(x: 1, y: 0, index: 0), DirectionalAction.right(0, CGPoint(x: 1, y: 0)))
		XCTAssertEqual(joystick.detectDirection(x: 1, y: 1, index: 0), DirectionalAction.upRight(0, CGPoint(x: 1, y: 1)))
		XCTAssertEqual(joystick.detectDirection(x: -1, y: 1, index: 0), DirectionalAction.upLeft(0, CGPoint(x: -1, y: 1)))
		XCTAssertEqual(joystick.detectDirection(x: 1, y: -1, index: 0), DirectionalAction.downRight(0, CGPoint(x: 1, y: -1)))
		XCTAssertEqual(joystick.detectDirection(x: -1, y: -1, index: 0), DirectionalAction.downLeft(0, CGPoint(x: -1, y: -1)))
	}

	func testDpadUp() throws {
		let expectationForPressingDpad = XCTestExpectation(description: "Dpad Up was pressed.")
		let expectationForReleasingDpad = XCTestExpectation(description: "Dpad Up was released.")
		guard let input = controller.extendedGamepad?.dpad as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.dpad.onChange.sink { action in
			switch action {
			case .up(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 1.0))
				expectationForPressingDpad.fulfill()
				input.releaseUp()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingDpad.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressUp()
		wait(for: [expectationForPressingDpad, expectationForReleasingDpad], timeout: 1.0)
    }

	func testDpadDown() throws {
		let expectationForPressingDpad = XCTestExpectation(description: "Dpad Down was pressed.")
		let expectationForReleasingDpad = XCTestExpectation(description: "Dpad Down was released.")
		guard let input = controller.extendedGamepad?.dpad as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.dpad.onChange.sink { action in
			switch action {
			case .down(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: -1.0))
				expectationForPressingDpad.fulfill()
				input.releaseDown()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingDpad.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressDown()
		wait(for: [expectationForPressingDpad, expectationForReleasingDpad], timeout: 1.0)
    }

	func testDpadLeft() throws {
		let expectationForPressingDpad = XCTestExpectation(description: "Dpad Left was pressed.")
		let expectationForReleasingDpad = XCTestExpectation(description: "Dpad Left was released.")
		guard let input = controller.extendedGamepad?.dpad as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.dpad.onChange.sink { action in
			switch action {
			case .left(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: -1.0, y: 0.0))
				expectationForPressingDpad.fulfill()
				input.releaseLeft()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingDpad.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressLeft()
		wait(for: [expectationForPressingDpad, expectationForReleasingDpad], timeout: 1.0)
    }

	func testDpadRight() throws {
		let expectationForPressingDpad = XCTestExpectation(description: "Dpad Right was pressed.")
		let expectationForReleasingDpad = XCTestExpectation(description: "Dpad Right was released.")
		guard let input = controller.extendedGamepad?.dpad as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.dpad.onChange.sink { action in
			switch action {
			case .right(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 1.0, y: 0.0))
				expectationForPressingDpad.fulfill()
				input.releaseRight()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingDpad.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressRight()
		wait(for: [expectationForPressingDpad, expectationForReleasingDpad], timeout: 1.0)
    }
}
