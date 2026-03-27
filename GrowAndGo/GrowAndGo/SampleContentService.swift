//
//  SampleContentService.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

struct SampleContentService {
    let letters: [LetterLesson] = [
        .init(letter: "A", word: "Apple", emoji: "🍎"),
        .init(letter: "B", word: "Ball", emoji: "⚽️"),
        .init(letter: "C", word: "Cat", emoji: "🐱"),
        .init(letter: "D", word: "Duck", emoji: "🦆"),
        .init(letter: "E", word: "Elephant", emoji: "🐘")
    ]

    let numbers: [NumberLesson] = [
        .init(number: 1, objects: ["⭐️"]),
        .init(number: 2, objects: ["🍎", "🍎"]),
        .init(number: 3, objects: ["🐟", "🐟", "🐟"]),
        .init(number: 4, objects: ["🚗", "🚗", "🚗", "🚗"]),
        .init(number: 5, objects: ["🧸", "🧸", "🧸", "🧸", "🧸"])
    ]

    let colors: [ColorLesson] = [
        .init(name: "Red", examples: ["Apple", "Balloon"]),
        .init(name: "Blue", examples: ["Sky", "Whale"]),
        .init(name: "Yellow", examples: ["Sun", "Duck"]),
        .init(name: "Green", examples: ["Leaf", "Frog"])
    ]
}
