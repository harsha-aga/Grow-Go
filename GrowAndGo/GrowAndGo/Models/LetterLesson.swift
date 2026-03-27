//
//  LetterLesson.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

struct LetterLesson: Identifiable, Codable, Equatable {
    let id: UUID
    let letter: String
    let word: String
    let emoji: String

    init(letter: String, word: String, emoji: String) {
        self.id = UUID()
        self.letter = letter
        self.word = word
        self.emoji = emoji
    }
}
