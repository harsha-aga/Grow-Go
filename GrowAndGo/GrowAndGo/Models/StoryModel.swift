//
//  StoryModels.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

struct StoryRequest: Codable {
    let childName: String
    let childAge: Int
    let topic: String
    let theme: String
    let parentGoal: String
    let length: String
}

struct StoryImage: Codable, Identifiable, Equatable {
    let scene_id: Int
    let caption: String
    let image_base64: String

    var id: Int { scene_id }
}

struct StoryResponse: Codable, Equatable {
    let title: String
    let target_age: String
    let topic: String
    let moral: String
    let story_text: String
    let focus_words: [String]
    let parent_followup_questions: [String]
    let images: [StoryImage]?
}


