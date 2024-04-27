//
//  StatesParamsView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/20/24.
//

import SwiftUI


struct StatesParamsView: View {
    @ObservedObject var fsmViewModel: FSMViewModel
    @SwiftUI.State var jumpHeight = "10.0"
    
    var body: some View {
        Form {
            Section(header: Text("Jump Height")) {
                TextField("Jump height", text: $jumpHeight)
            }
        }.contentMargins(0.0).scrollContentBackground(.hidden)
    }
}
