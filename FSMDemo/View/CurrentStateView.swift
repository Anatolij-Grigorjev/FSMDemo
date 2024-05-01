//
//  CurrentStateView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/20/24.
//

import SwiftUI


struct CurrentStateView: View {
    @ObservedObject var fsmViewModel: FSMViewModel
    @SwiftUI.State var localCurrentStateName: String = "N\\A"
    @SwiftUI.State var localStateExpiresText: String = "N\\A"
    @SwiftUI.State var localNextStateName: String = "N\\A"
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Form {
            LabeledContent("Current State: ", value: fsmViewModel.currentStateName)
            LabeledContent("State Expires In: ", value: localStateExpiresText)
            LabeledContent("Next State: ", value: fsmViewModel.nextStateName ?? "N\\A")
        }
        .contentMargins(0.0).scrollContentBackground(.hidden).padding(0.0)
        .onAppear() {
            setViewState()
        }.onReceive(timer) { time in
            guard let expryTime: Float = fsmViewModel.currentStateExpiresIn() else {
                return
            }
            setViewState()
            if (expryTime <= 0.0) {
                fsmViewModel.statePicked(nextStateName: fsmViewModel.nextStateName ?? "")
                setViewState()
            }
        }
        Divider()
    }
    
    fileprivate func setViewState() {
        localCurrentStateName = fsmViewModel.currentStateName
        localStateExpiresText = formattedRemainder(amount: fsmViewModel.currentStateExpiresIn())
        localNextStateName = fsmViewModel.nextStateName ?? "N\\A"
    }
    
    fileprivate func formattedRemainder(amount: Float?) -> String {
        guard let knownAmount: Float = amount else {
            return "N\\A"
        }
        
        return "\(String(format: "%.2f", knownAmount))s"
    }
}
