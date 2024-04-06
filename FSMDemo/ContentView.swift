//
//  ContentView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                StatesView()
                CurrentStateInfoView()
            }
        }.frame(height: 650, alignment: .topLeading)
    }
}

#Preview {
    ContentView()
}

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
            })
        }.padding()
        Divider()
    }
}

struct CurrentStateInfoView: View {
    var body: some View {
        Form {
            LabeledContent("Current State: ", value: "<???>")
            LabeledContent("State Expires In: ", value: "N\\A")
            LabeledContent("Next State: ", value: "N\\A")
        }
        .contentMargins(0.0).scrollContentBackground(.hidden).frame(maxHeight: 150)
        Divider()
    }
}
