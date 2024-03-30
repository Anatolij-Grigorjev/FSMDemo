//
//  State.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import Foundation

class State: Hashable, Equatable {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: State, rhs: State) -> Bool {
        false
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}
