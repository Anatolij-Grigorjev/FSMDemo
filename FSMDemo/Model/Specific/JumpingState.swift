//
//  JumpState.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import Foundation

class JumpingState: State {
    
    static let DEFAULT_JUMP_HEIGHT = 8
    
    var jumpHeight: Int = DEFAULT_JUMP_HEIGHT
    
    init() {
        super.init(name: "Jumping")
    }
}
