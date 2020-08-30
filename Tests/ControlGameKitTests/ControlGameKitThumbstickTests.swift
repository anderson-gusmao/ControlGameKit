//
//  ControlGameKitThumbstickTests.swift
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
class ControlGameKitThumbstickTests: XCTestCase {

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

	func testLeftThumbstickUp() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Left Thumbstick Up was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Left Thumbstick Up was released.")
		guard let input = controller.extendedGamepad?.leftThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveLeft.sink { action in
			switch action {
			case .up(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 1.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseUp()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressUp()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testLeftThumbstickDown() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Left Thumbstick Down was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Left Thumbstick Down was released.")
		guard let input = controller.extendedGamepad?.leftThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveLeft.sink { action in
			switch action {
			case .down(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: -1.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseDown()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressDown()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testLeftThumbstickLeft() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Left Thumbstick Left was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Left Thumbstick Left was released.")
		guard let input = controller.extendedGamepad?.leftThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveLeft.sink { action in
			switch action {
			case .left(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: -1.0, y: 0.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseLeft()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressLeft()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testLeftThumbstickRight() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Left Thumbstick Right was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Left Thumbstick Right was released.")
		guard let input = controller.extendedGamepad?.leftThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveLeft.sink { action in
			switch action {
			case .right(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 1.0, y: 0.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseRight()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressRight()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testRightThumbstickUp() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Right Thumbstick Up was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Right Thumbstick Up was released.")
		guard let input = controller.extendedGamepad?.rightThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveRight.sink { action in
			switch action {
			case .up(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 1.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseUp()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressUp()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testRightThumbstickDown() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Right Thumbstick Down was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Right Thumbstick Down was released.")
		guard let input = controller.extendedGamepad?.rightThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveRight.sink { action in
			switch action {
			case .down(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: -1.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseDown()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressDown()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testRightThumbstickLeft() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Right Thumbstick Left was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Right Thumbstick Left was released.")
		guard let input = controller.extendedGamepad?.rightThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveRight.sink { action in
			switch action {
			case .left(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: -1.0, y: 0.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseLeft()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressLeft()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }

	func testRightThumbstickRight() throws {
		let expectationForPressingThumbstick = XCTestExpectation(description: "Right Thumbstick Right was pressed.")
		let expectationForReleasingThumbstick = XCTestExpectation(description: "Right Thumbstick Right was released.")
		guard let input = controller.extendedGamepad?.rightThumbstick as? GCControllerDirectionPadMock else { fatalError() }

		cancellable = joystick.thumbstick.onMoveRight.sink { action in
			switch action {
			case .right(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 1.0, y: 0.0))
				expectationForPressingThumbstick.fulfill()
				input.releaseRight()
			case .center(let index, let point):
				XCTAssertEqual(index, 1)
				XCTAssertEqual(point, CGPoint(x: 0.0, y: 0.0))
				expectationForReleasingThumbstick.fulfill()
			default:
				XCTFail()
			}
		}

		input.pressRight()
		wait(for: [expectationForPressingThumbstick, expectationForReleasingThumbstick], timeout: 1.0)
    }
}
