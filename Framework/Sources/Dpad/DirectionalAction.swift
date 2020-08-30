//
//  DpadAction.swift
//  ControlGameKit
//
//  Created by Anderson Santos Gusmão on 24/08/20.
//  Copyright © 2020 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

public enum DirectionalAction: Equatable {
	case up(Int, CGPoint)
	case down(Int, CGPoint)
	case left(Int, CGPoint)
	case right(Int, CGPoint)
	case upLeft(Int, CGPoint)
	case upRight(Int, CGPoint)
	case downRight(Int, CGPoint)
	case downLeft(Int, CGPoint)
	case center(Int, CGPoint)
}
