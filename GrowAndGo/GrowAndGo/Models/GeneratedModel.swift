//
//  GeneratedModel.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

struct GeneratedStory: Identifiable, Codable, Equatable {
    let id: UUID
    let promptTopic: String
    let promptTheme: String
    let promptGoal: String
    let response: StoryResponse

    init(promptTopic: String, promptTheme: String, promptGoal: String, response: StoryResponse) {
        self.id = UUID()
        self.promptTopic = promptTopic
        self.promptTheme = promptTheme
        self.promptGoal = promptGoal
        self.response = response
    }
}

