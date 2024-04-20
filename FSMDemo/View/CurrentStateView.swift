//
//  CurrentStateView.swift
//  FSMDemo
//
//  Created by Anatolij Grigorjev on 4/20/24.
//

import SwiftUI


struct CurrentStateView: View {
    var body: some View {
        Form {
            LabeledContent("Current State: ", value: "<???>")
            LabeledContent("State Expires In: ", value: "N\\A")
            LabeledContent("Next State: ", value: "N\\A")
        }
        .contentMargins(0.0).scrollContentBackground(.hidden).padding(0.0)
        Divider()
    }
}
