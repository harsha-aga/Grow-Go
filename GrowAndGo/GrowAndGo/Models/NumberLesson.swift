//
//  NewLesson.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

struct NumberLesson: Identifiable, Codable, Equatable {
    let id: UUID
    let number: Int
    let objects: [String]

    init(number: Int, objects: [String]) {
        self.id = UUID()
        self.number = number
        self.objects = objects
    }
}
