//
//  ControlGameKitTests.swift
//  ControlGameKitTests
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import XCTest
import GameController
import Combine
@testable import ControlGameKit

class ControlGameKitButtonsTests: XCTestCase {

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

    func testButtonA() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button A was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button A was released.")

		cancellable = joystick.buttons.onActionA.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonA()
		input.releaseButtonA()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)

    }

	func testButtonB() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button B was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button B was released.")

		cancellable = joystick.buttons.onActionB.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonB()
		input.releaseButtonB()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonX() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button X was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button X was released.")

		cancellable = joystick.buttons.onActionX.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonX()
		input.releaseButtonX()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonY() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Y was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Y was released.")

		cancellable = joystick.buttons.onActionY.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonY()
		input.releaseButtonY()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonMenu() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Menu was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Menu was released.")

		cancellable = joystick.buttons.onActionMenu.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonMenu()
		input.releaseButtonMenu()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonOptions() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Options was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Options was released.")

		cancellable = joystick.buttons.onActionOption.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonOptions()
		input.releaseButtonOptions()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonLeftShoulder() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Left Shoulder was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Left Shoulder was released.")

		cancellable = joystick.buttons.onActionLeftShoulder.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonLeftShoulder()
		input.releaseButtonLeftShoulder()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonRightShoulder() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Right Shoulder was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Right Shoulder was released.")

		cancellable = joystick.buttons.onActionRightShoulder.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonRightShoulder()
		input.releaseButtonRightShoulder()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonLeftTrigger() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Left Trigger was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Left Trigger was released.")

		cancellable = joystick.buttons.onActionLeftTrigger.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(value, 0.5)
				XCTAssertEqual(index, 1)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonLeftTrigger(value: 0.5)
		input.releaseButtonLeftTrigger()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonRightTrigger() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Right Trigger was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Right Trigger was released.")

		cancellable = joystick.buttons.onActionRightTrigger.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(value, 0.5)
				XCTAssertEqual(index, 1)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonRightTrigger(value: 0.5)
		input.releaseButtonRightTrigger()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonLeftStick() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Left Stick was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Left Stick was released.")

		cancellable = joystick.thumbstick.onPressLeft.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonLeftThumbstick()
		input.releaseButtonLeftThumbstick()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }

	func testButtonRightStick() throws {
		let expectationForPressingButton = XCTestExpectation(description: "Button Right Stick was pressed.")
		let expectationForReleasingButton = XCTestExpectation(description: "Button Right Stick was released.")

		cancellable = joystick.thumbstick.onPressRight.sink { action in
			switch action {
			case .pressed(let index, let value):
				XCTAssertEqual(index, 1)
				XCTAssertNil(value)
				expectationForPressingButton.fulfill()
			case .released(let index):
				XCTAssertEqual(index, 1)
				expectationForReleasingButton.fulfill()
			}
		}
		guard let input = controller.extendedGamepad as? GCExtendedGamepadMock else { fatalError() }
		input.pressButtonRightThumbstick()
		input.releaseButtonRightThumbstick()
		wait(for: [expectationForPressingButton, expectationForReleasingButton], timeout: 1.0)
    }
}
