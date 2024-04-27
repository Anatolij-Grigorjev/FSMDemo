//
//  StatesView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/20/24.
//

import SwiftUI


struct StateButton: View {
    var body: some View {
        Button(
            action: { viewModel.statePicked(nextStateName: stateName) },
            label: { Text(stateName) }
        )
        .disabled(!isStateAvailable)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    let stateName: String
    let viewModel: FSMViewModel
    let isStateAvailable: Bool
    
    init(stateName: String, viewModel: FSMViewModel) {
        self.stateName = stateName
        self.viewModel =  viewModel
        self.isStateAvailable = viewModel.enabledStatesNames.contains(stateName)
    }
}

struct StatesView: View {
    @ObservedObject var fsmViewModel: FSMViewModel
    
    private let gridConfig = [
        GridItem(.fixed(100)), 
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("States:")
            LazyHGrid(rows: gridConfig, spacing: 20) {
                ForEach(fsmViewModel.possibleStates(), id: \.self) { text in
                    StateButton(stateName: text, viewModel: fsmViewModel)
                }
            }.padding(.top)
        }.padding()
        Divider()
    }
}
