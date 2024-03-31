//
//  FSMTransitionsTests.swift
//  FSMDemoTests
//
//  Created by Anatolij Grigorjev on 3/31/24.
//

import XCTest
@testable import FSMDemo

final class FSMTransitionsTests: XCTestCase {
    
    func fromStandingToWalking() {
        let fsm = FSM(initialStateName: "Standing")
        fsm.setState(nextStateName: "Walking")
        XCTAssertEqual(fsm.currentState, .walking)
        XCTAssertEqual(fsm.allowedNextStates, [.standing, .running, .jumping])
        XCTAssertEqual(fsm.currentStateExpiresIn, nil)
        XCTAssertEqual(fsm.nextState, nil)
    }
    
    func fromStandingToJumping() {
        let fsm = FSM(initialStateName: "Standing")
        fsm.setState(nextStateName: "Jumping")
        XCTAssertEqual(fsm.currentState, .jumping)
        XCTAssertEqual(fsm.allowedNextStates, [])
        XCTAssertEqual(fsm.currentStateExpiresIn, fsm.currentJumpHeight / 2)
        XCTAssertEqual(fsm.nextState, .falling)
    }
    
}
