//
//  FSMErrors.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import Foundation


enum FSMErrors: Error {
    case stateNotFound(withName: String)
    case invalidTransition(toState: State)
}
