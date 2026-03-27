//
//  StoryViewModel.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation
import Combine

@MainActor
final class StoryViewModel: ObservableObject {
    @Published var story: StoryResponse?
    @Published var isLoading = false
    @Published var errorMessage: String?

    @Published var topic = "counting"
    @Published var theme = "bedtime"
    @Published var parentGoal = "Teach numbers 1 to 5"
    @Published var length = "short"

    private let api = StoryAPIService()
    private weak var appState: AppState?

    func bind(appState: AppState) {
        self.appState = appState
    }

    func generateStory() async {
        guard let appState = appState,
              let profile = appState.childProfile else {
            errorMessage = "Missing child profile"
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let request = StoryRequest(
                childName: profile.name,
                childAge: profile.ageGroup.minAge,
                topic: topic,
                theme: theme,
                parentGoal: parentGoal,
                length: length
            )

            let response = try await api.generateStory(request: request)
            self.story = response

            let generated = GeneratedStory(
                promptTopic: topic,
                promptTheme: theme,
                promptGoal: parentGoal,
                response: response
            )

            appState.saveGeneratedStory(generated)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
