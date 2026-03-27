//
//  Color Lesson.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//
import Foundation

struct ColorLesson: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let examples: [String]

    init(name: String, examples: [String]) {
        self.id = UUID()
        self.name = name
        self.examples = examples
    }
}
