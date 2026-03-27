//
//  NumbersView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct NumbersView: View {
    @EnvironmentObject private var appState: AppState
    private let content = SampleContentService()

    var body: some View {
        List(content.numbers) { lesson in
            VStack(alignment: .leading, spacing: 12) {
                Text("Number \(lesson.number)")
                    .font(.title2.bold())

                Text(lesson.objects.joined(separator: " "))
                    .font(.largeTitle)

                Button("Read Aloud") {
                    AudioService.shared.speak("This is number \(lesson.number)")
                    appState.addProgress(.init(topic: .numbers, title: "Number \(lesson.number)", score: 1.0))
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("Numbers")
    }
}
