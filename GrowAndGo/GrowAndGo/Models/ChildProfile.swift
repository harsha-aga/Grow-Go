//
//  ChildProfile.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

struct ChildProfile: Codable, Equatable {
    var name: String
    var ageGroup: AgeGroup
    var enabledTopics: [LearningTopic]
}
