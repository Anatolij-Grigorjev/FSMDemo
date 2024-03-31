//
//  FSMTests.swift
//  FSMDemoTests
//
//  Created by Anatolij Grigorjev on 3/31/24.
//

import XCTest
@testable import FSMDemo

final class NewFSMTests: XCTestCase {
    
    private let fsm: FSM = FSM()
    
    func newFsmDefaultStateIsStanding() {
        XCTAssertEqual(fsm.currentState, .standing)
    }
    
    func newFsmAllowedStatesFromStanding() {
        XCTAssertEqual(fsm.allowedNextStates, [.walking, .jumping])
    }
    
    func newFsmStandingStateDoesNotExpire() {
        XCTAssertEqual(fsm.currentStateExpiresIn, nil)
    }
    
    func newFsmStandingDoesNotHaveNextState() {
        XCTAssertEqual(fsm.nextState, nil)
    }
}
