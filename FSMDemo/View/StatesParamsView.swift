//
//  StatesParamsView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/20/24.
//

import SwiftUI


struct StatesParamsView: View {
    @ObservedObject var fsmViewModel: FSMViewModel
    @SwiftUI.State var localJumpHeightText: String = "10.0"
    @SwiftUI.FocusState var jumpHeightFieldFocused: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Jump Height")) {
                HStack {
                    TextField("Jump height", text: $localJumpHeightText)
                        .focused($jumpHeightFieldFocused)
                    Button("Save") {
                        fsmViewModel.setJumpHeight(localJumpHeightText)
                        setViewState()
                        jumpHeightFieldFocused = false
                    }.buttonStyle(.borderedProminent)
                }
            }
        }.contentMargins(0.0).scrollContentBackground(.hidden).onAppear {
            setViewState()
        }
    }
    
    fileprivate func setViewState() {
        self.localJumpHeightText = fsmViewModel.currentJumpHeight
    }
}
