//
//  FSMViewModel.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/27/24.
//

import SwiftUI

class FSMViewModel: ObservableObject {
    private let fsm: FSM = FSM(initialStateName: State.standing.name)
    
    @Published var currentStateName: String = "<???>"
    @Published var nextStateName: String? = nil
    @Published var stateExpiresIn: Float? = nil
    @Published var enabledStatesNames: Array<String> = []
    
    @Published var errorMessage: String? = nil
    
    init() {
        readFSMState()
    }
    
    func statePicked(nextStateName: String) {
        trySetNextState(nextStateName)
        readFSMState()
    }
    
    func possibleStates() -> Array<String> {
        return fsm.allStates.map(\.name)
    }
    
    fileprivate func readFSMState() {
        currentStateName = fsm.currentState.name
        nextStateName = fsm.nextState?.name
        stateExpiresIn = fsm.currentStateExpiresIn()
        enabledStatesNames = fsm.allowedNextStates.map(\.name)
    }
    
    fileprivate func trySetNextState(_ nextStateName: String) {
        do {
            try fsm.setState(nextStateName: nextStateName)
            errorMessage = nil
        } catch FSMErrors.invalidTransition(let nextInvalidState) {
            errorMessage = "Transition to state \(nextInvalidState.name) not allowed here!"
        } catch FSMErrors.stateNotFound(let missingStateName) {
            errorMessage = "Cannot transition to missing state \(missingStateName)!"
        } catch {
            errorMessage = "Unexpected issue \(error)"
        }
    }
}
