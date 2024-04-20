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
            action: { print(stateName) },
            label: { Text(stateName) }
        ).buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
    let stateName: String
    
    init(stateName: String) {
        self.stateName = stateName
    }
}

struct StatesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("States:")
            HStack(spacing: 20, content: {
                ForEach(["1", "2", "3"], id: \.self) { text in StateButton(stateName: text) }
            }).padding(.top)
        }.padding()
        Divider()
    }
}
