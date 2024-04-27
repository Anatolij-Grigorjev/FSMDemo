//
//  CurrentStateView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/20/24.
//

import SwiftUI


struct CurrentStateView: View {
    @ObservedObject var fsmViewModel: FSMViewModel
    
    var body: some View {
        Form {
            LabeledContent("Current State: ", value: fsmViewModel.currentStateName)
            LabeledContent("State Expires In: ", value: formattedRemainder(amount: fsmViewModel.stateExpiresIn))
            LabeledContent("Next State: ", value: fsmViewModel.nextStateName ?? "N\\A")
        }
        .contentMargins(0.0).scrollContentBackground(.hidden).padding(0.0)
        Divider()
    }
    
    fileprivate func formattedRemainder(amount: Float?) -> String {
        guard let knownAmount: Float = amount else {
            return "N\\A"
        }
        
        return "\(String(format: "%.2f", knownAmount))s"
    }
}
