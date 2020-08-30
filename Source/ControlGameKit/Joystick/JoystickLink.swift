//
//  JoystickLink.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation
import Combine

@available(OSX 10.15, *)
public struct JoystickLink {

	public var onConnect: AnyPublisher<Void, Never> {
		onConnectSubject.eraseToAnyPublisher()
	}

	public var onDisconnect: AnyPublisher<Void, Never> {
		onDisconnectSubject.eraseToAnyPublisher()
	}

	let onConnectSubject = PassthroughSubject<Void, Never>()
	let onDisconnectSubject = PassthroughSubject<Void, Never>()
}
