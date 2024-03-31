//
//  KnownStates.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/31/24.
//

import Foundation

extension State {
    
    static let standing = State(name: "Standing")
    static let walking = State(name: "Walking")
    static let running = State(name: "Running")
    static let jumping = JumpingState()
    static let falling = State(name: "Falling")
    static let laying = State(name: "Laying")
}
