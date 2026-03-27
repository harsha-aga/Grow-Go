//
//  ColorsView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI
import Combine

struct ColorsView: View {
    @EnvironmentObject private var appState: AppState
    private let content = SampleContentService()

    var body: some View {
        List(content.colors) { lesson in
            VStack(alignment: .leading, spacing: 8) {
                Text(lesson.name)
                    .font(.title2.bold())
                Text("Examples: \(lesson.examples.joined(separator: ", "))")
                    .foregroundStyle(.secondary)
                Button("Practice") {
                    AudioService.shared.speak("This color is \(lesson.name)")
                    appState.addProgress(.init(topic: .colors, title: lesson.name, score: 1.0))
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Colors")
    }
}
