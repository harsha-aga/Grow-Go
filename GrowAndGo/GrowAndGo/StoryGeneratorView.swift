//
//  StortGeneratorView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct StoryGeneratorView: View {
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel = StoryViewModel()

    var body: some View {
        Form {
            Section("Story Settings") {
                TextField("Topic", text: $viewModel.topic)
                TextField("Theme", text: $viewModel.theme)
                TextField("Parent Goal", text: $viewModel.parentGoal)
                Picker("Length", selection: $viewModel.length) {
                    Text("Short").tag("short")
                    Text("Medium").tag("medium")
                }
            }

            Section {
                Button {
                    viewModel.bind(appState: appState)
                    Task { await viewModel.generateStory() }
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("Generate Story")
                    }
                }
            }

            if let story = viewModel.story {
                Section(story.title) {
                    Text(story.story_text)
                    Text("Moral: \(story.moral)")
                    Text("Focus words: \(story.focus_words.joined(separator: ", "))")
                    ForEach(story.parent_followup_questions, id: \.self) { question in
                        Text("• \(question)")
                    }
                    Button("Read Aloud") {
                        AudioService.shared.speak(story.story_text)
                    }
                    if let images = story.images {
                        ForEach(images) { image in
                            VStack(alignment: .leading, spacing: 8) {
                                if let data = Data(base64Encoded: image.image_base64),
                                   let uiImage = UIImage(data: data) {
                                    
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                } else {
                                    Color.gray.frame(height: 220)
                                }
                                Text(image.caption)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }

            if let errorMessage = viewModel.errorMessage {
                Section("Error") {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("Story Time")
    }
}
