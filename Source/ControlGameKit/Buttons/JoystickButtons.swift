//
//  JoystickButtons.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation
import Combine

@available(OSX 10.15, *)
public struct JoystickButtons {

	public var onActionA: AnyPublisher<ButtonAction, Never> {
		onActionASubject.eraseToAnyPublisher()
	}

	public var onActionB: AnyPublisher<ButtonAction, Never> {
		onActionBSubject.eraseToAnyPublisher()
	}

	public var onActionX: AnyPublisher<ButtonAction, Never> {
		onActionXSubject.eraseToAnyPublisher()
	}

	public var onActionY: AnyPublisher<ButtonAction, Never> {
		onActionYSubject.eraseToAnyPublisher()
	}

	public var onActionMenu: AnyPublisher<ButtonAction, Never> {
		onActionMenuSubject.eraseToAnyPublisher()
	}

	public var onActionOption: AnyPublisher<ButtonAction, Never> {
		onActionOptionSubject.eraseToAnyPublisher()
	}

	public var onActionLeftTrigger: AnyPublisher<ButtonAction, Never> {
		onActionLeftTriggerSubject.eraseToAnyPublisher()
	}

	public var onActionRightTrigger: AnyPublisher<ButtonAction, Never> {
		onActionRightTriggerSubject.eraseToAnyPublisher()
	}

	public var onActionLeftShoulder: AnyPublisher<ButtonAction, Never> {
		onActionLeftShoulderSubject.eraseToAnyPublisher()
	}

	public var onActionRightShoulder: AnyPublisher<ButtonAction, Never> {
		onActionRightShoulderSubject.eraseToAnyPublisher()
	}

	let onActionASubject = PassthroughSubject<ButtonAction, Never>()
	let onActionBSubject = PassthroughSubject<ButtonAction, Never>()
	let onActionXSubject = PassthroughSubject<ButtonAction, Never>()
	let onActionYSubject = PassthroughSubject<ButtonAction, Never>()

	let onActionOptionSubject = PassthroughSubject<ButtonAction, Never>()
	let onActionMenuSubject = PassthroughSubject<ButtonAction, Never>()

	let onActionLeftShoulderSubject = PassthroughSubject<ButtonAction, Never>()
	let onActionRightShoulderSubject = PassthroughSubject<ButtonAction, Never>()

	let onActionLeftTriggerSubject = PassthroughSubject<ButtonAction, Never>()
	let onActionRightTriggerSubject = PassthroughSubject<ButtonAction, Never>()
}
