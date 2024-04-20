//
//  ContentView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    StatesView()
                    CurrentStateView()
                    StatesParamsView()
                }
            }.frame(height: geometry.size.height, alignment: .topLeading)
        }
    }
}

#Preview {
    ContentView()
}
