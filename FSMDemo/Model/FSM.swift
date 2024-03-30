//
//  FSM.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import Foundation


class FSM {
    
    private let states: Dictionary<String, State>
    private let nextStatesMap: Dictionary<State, State>
    private let allowedNextStatesMap: Dictionary<State, Array<State>>
    var currentState: State
    
    init() {
        
    }
}
