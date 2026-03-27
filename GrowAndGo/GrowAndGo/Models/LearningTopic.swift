//
//  LearningTopic.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

enum LearningTopic: String, Codable, CaseIterable, Identifiable {
    case letters
    case numbers
    case math
    case colors
    case writing
    case stories
    case art

    var id: String { rawValue }

    var title: String {
        switch self {
        case .letters: return "Letters"
        case .numbers: return "Numbers"
        case .math: return "Math"
        case .colors: return "Colors"
        case .writing: return "Trace & Write"
        case .stories: return "Stories"
        case .art: return "Art"
        }
    }

    var emoji: String {
        switch self {
        case .letters: return "🔤"
        case .numbers: return "🔢"
        case .math: return "➕"
        case .colors: return "🎨"
        case .writing: return "✍️"
        case .stories: return "📚"
        case .art: return "🖍️"
        }
    }
}
