//
//  AgeGroup.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

enum AgeGroup: String, Codable, CaseIterable, Identifiable {
    case twoToThree = "2-3"
    case fourToFive = "4-5"
    case sixToSeven = "6-7"

    var id: String { rawValue }

    var minAge: Int {
        switch self {
        case .twoToThree: return 2
        case .fourToFive: return 4
        case .sixToSeven: return 6
        }
    }
}
