//
//  ParentGateView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct ParentGateView: View {
    @State private var answer = ""
    @State private var unlocked = false

    private let a = 3
    private let b = 4

    var body: some View {
        Group {
            if unlocked {
                ParentDashboardView()
            } else {
                Form {
                    Section("Parent Check") {
                        Text("What is \(a) + \(b)?")
                        TextField("Answer", text: $answer)
                            .keyboardType(.numberPad)
                        Button("Unlock") {
                            unlocked = answer == String(a + b)
                        }
                    }
                }
                .navigationTitle("Parents Only")
            }
        }
    }
}
