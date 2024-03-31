//
//  FSM.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import Foundation


class FSM {
    
    private let states: Array<State>
    private let statesLookup: Dictionary<String, State>
    private let nextStatesMap: Dictionary<State, State>
    private let allowedNextStatesMap: Dictionary<State, Array<State>>
    var currentState: State
    private var currentStateExpiresAt: Date?
    
    init(initialStateName: String) {
        self.states = FSM.buildStatesList()
        self.statesLookup = FSM.createStatesLookup(fromStates: states)
        self.nextStatesMap = FSM.buildNextStatesMap()
        self.allowedNextStatesMap = FSM.buildAllowedNextStatesMap()
        self.currentState = statesLookup[initialStateName]!
        self.currentStateExpiresAt = nil
    }
    
    private static func buildStatesList() -> Array<State> {
        return [
            .standing,
            .walking,
            .running,
            .jumping,
            .falling,
            .laying
        ]
    }
    
    private static func createStatesLookup(fromStates: Array<State>) -> Dictionary<String, State> {
        return Dictionary()
    }
    
    private static func buildNextStatesMap() -> Dictionary<State, State> {
        return Dictionary()
    }
    
    private static func buildAllowedNextStatesMap() -> Dictionary<State, Array<State>> {
        return Dictionary()
    }
}
