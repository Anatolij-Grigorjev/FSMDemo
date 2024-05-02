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
    
    public func setState(nextStateName: String) throws {
        guard let proposedNextState = statesLookup[nextStateName] else {
            throw FSMErrors.stateNotFound(withName: nextStateName)
        }
        guard allowedNextStates.contains(proposedNextState) || nextPlannedState != nil else {
            throw FSMErrors.invalidTransition(toState: proposedNextState)
        }
        self.currentState = proposedNextState
        switch proposedNextState {
            case .jumping:
                self.currentStateExpiresAt = Date.now.advanced(by: Double(currentJumpHeight) / 2.0)
            case .falling:
                self.currentStateExpiresAt = Date.now.advanced(by: Double(currentJumpHeight) / 4.0)
            case .laying:
                self.currentStateExpiresAt = Date.now.advanced(by: Double(5.0))
            default:
                self.currentStateExpiresAt = nil
        }
    }
    
    public func adjustJumpHeight(newJumpHieght: Int) {
        jumpingState.jumpHeight = newJumpHieght
    }
    
    public var allStates: Array<State> {
        get { states }
    }
    
    public var allowedNextStates: Array<State> {
        get { allowedNextStatesMap[currentState] ?? [] }
    }
    
    public func currentStateExpiresIn() -> Float? {
        guard let expryDate = self.currentStateExpiresAt else {
            return nil
        }
        return Float(expryDate.timeIntervalSince1970 - Date.now.timeIntervalSince1970)
    }
    
    public var nextPlannedState: State? {
        get { nextStatesMap[currentState] ?? nil }
    }
    
    public var currentJumpHeight: Int {
        get { jumpingState.jumpHeight }
    }
    
    private var jumpingState: JumpingState {
        (statesLookup["Jumping"]! as! JumpingState)
    }
    
    private static func buildStatesList() -> Array<State> {
        return [
            .standing,
            .walking,
            .running,
            .jumping,
            .falling,
            .laying,
        ]
    }
    
    private static func createStatesLookup(fromStates: Array<State>) -> Dictionary<String, State> {
        return Dictionary(uniqueKeysWithValues: fromStates.map { ($0.name, $0) })
    }
    
    private static func buildNextStatesMap() -> Dictionary<State, State> {
        return Dictionary<State, State>(uniqueKeysWithValues: [
            (.jumping, .falling),
            (.falling, .laying),
            (.laying, .standing),
        ])
    }
    
    private static func buildAllowedNextStatesMap() -> Dictionary<State, Array<State>> {
        return Dictionary(uniqueKeysWithValues: [
            (.standing, [.walking, .running, .jumping]),
            (.walking, [.standing, .running, .jumping]),
            (.running, [.standing, .walking, .jumping]),
            (.jumping, []),
            (.falling, []),
            (.laying, []),
        ])
    }
}
