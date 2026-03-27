//
//  MathView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct MathView: View {
    @EnvironmentObject private var appState: AppState
    @State private var score = 0

    private let questions: [(Int, Int)] = [(1,1), (2,1), (2,2), (3,1)]

    var body: some View {
        List(questions, id: \.0) { left, right in
            HStack {
                VStack(alignment: .leading) {
                    Text("\(left) + \(right) = \(left + right)")
                        .font(.title3.bold())
                    Text(String(repeating: "⭐️", count: left) + " + " + String(repeating: "⭐️", count: right))
                }

                Spacer()

                Button("Done") {
                    score += 1
                    appState.addProgress(.init(topic: .math, title: "\(left)+\(right)", score: 1.0))
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Math")
    }
}
