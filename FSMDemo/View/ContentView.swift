//
//  ContentView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 3/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fsmViewModel: FSMViewModel = FSMViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    StatesView(fsmViewModel: fsmViewModel)
                    CurrentStateView(fsmViewModel: fsmViewModel)
                    StatesParamsView(fsmViewModel: fsmViewModel)
                }
            }.frame(height: geometry.size.height, alignment: .topLeading)
        }
    }
}

#Preview {
    ContentView()
}
