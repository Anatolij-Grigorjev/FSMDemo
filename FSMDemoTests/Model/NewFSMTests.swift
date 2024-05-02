//
//  FSMTests.swift
//  FSMDemoTests
//
//  Created by Anatolij Grigorjev on 3/31/24.
//

import XCTest
@testable import FSMDemo

final class NewFSMTests: XCTestCase {
    
    func newFsmDefaultStateIsPassed() {
        let fsm = FSM(initialStateName: "Standing")
        XCTAssertEqual(fsm.currentState, .standing)
    }
    
    func newFsmAllowedStatesFromStanding() {
        let fsm = FSM(initialStateName: "Standing")
        XCTAssertEqual(fsm.allowedNextStates, [.walking, .jumping])
    }
    
    func newFsmStandingStateDoesNotExpire() {
        let fsm = FSM(initialStateName: "Standing")
        XCTAssertEqual(fsm.currentStateExpiresIn(), nil)
    }
    
    func newFsmStandingDoesNotHaveNextState() {
        let fsm = FSM(initialStateName: "Standing")
        XCTAssertEqual(fsm.nextPlannedState, nil)
    }
}
