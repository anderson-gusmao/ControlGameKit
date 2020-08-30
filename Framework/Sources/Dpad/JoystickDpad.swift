//
//  JoystickDpad.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

import Foundation
import Combine

public struct JoystickDpad {

	public var onChange: AnyPublisher<DirectionalAction, Never> {
		subject
			.debounce(for: 0.1, scheduler: RunLoop.main)
			.eraseToAnyPublisher()
    }

	internal let subject = PassthroughSubject<DirectionalAction, Never>()
}
