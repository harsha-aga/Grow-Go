//
//  ProgressRecord.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

struct ProgressRecord: Identifiable, Codable, Equatable {
    let id: UUID
    let topic: LearningTopic
    let title: String
    let completedAt: Date
    let score: Double

    init(topic: LearningTopic, title: String, completedAt: Date = .now, score: Double) {
        self.id = UUID()
        self.topic = topic
        self.title = title
        self.completedAt = completedAt
        self.score = score
    }
}
