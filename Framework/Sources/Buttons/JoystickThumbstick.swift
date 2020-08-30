//
//  JoystickThumbstickButton.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation
import Combine

public struct JoystickThumbstick {

	public var onMoveLeft: AnyPublisher<DirectionalAction, Never> {
		leftMoveSubject.eraseToAnyPublisher()
    }

	public var onMoveRight: AnyPublisher<DirectionalAction, Never> {
		rightMoveSubject.eraseToAnyPublisher()
    }

	public var onPressLeft: AnyPublisher<ButtonAction, Never> {
		leftPressSubject.eraseToAnyPublisher()
    }

	public var onPressRight: AnyPublisher<ButtonAction, Never> {
		rightPressSubject.eraseToAnyPublisher()
    }

	internal let leftMoveSubject = PassthroughSubject<DirectionalAction, Never>()
	internal let rightMoveSubject = PassthroughSubject<DirectionalAction, Never>()
	internal let leftPressSubject = PassthroughSubject<ButtonAction, Never>()
	internal let rightPressSubject = PassthroughSubject<ButtonAction, Never>()
}
