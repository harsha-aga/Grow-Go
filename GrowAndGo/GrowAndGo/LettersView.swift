//
//  LettersView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct LettersView: View {
    @EnvironmentObject private var appState: AppState
    private let content = SampleContentService()

    var body: some View {
        List(content.letters) { lesson in
            Button {
                AudioService.shared.speak("\(lesson.letter). \(lesson.letter) is for \(lesson.word)")
                appState.addProgress(.init(topic: .letters, title: lesson.letter, score: 1.0))
            } label: {
                HStack(spacing: 16) {
                    Text(lesson.emoji)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text(lesson.letter)
                            .font(.title.bold())
                        Text("\(lesson.word)")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Letters")
    }
}
