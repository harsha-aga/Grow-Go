//
//  LocalStorageService.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

final class LocalStorageService {
    private let profileKey = "brightpath.profile"
    private let progressKey = "brightpath.progress"
    private let storiesKey = "brightpath.stories"

    func saveProfile(_ profile: ChildProfile) {
        save(profile, forKey: profileKey)
    }

    func loadProfile() -> ChildProfile? {
        load(ChildProfile.self, forKey: profileKey)
    }

    func saveProgress(_ progress: [ProgressRecord]) {
        save(progress, forKey: progressKey)
    }

    func loadProgress() -> [ProgressRecord] {
        load([ProgressRecord].self, forKey: progressKey) ?? []
    }

    func saveStories(_ stories: [GeneratedStory]) {
        save(stories, forKey: storiesKey)
    }

    func loadStories() -> [GeneratedStory] {
        load([GeneratedStory].self, forKey: storiesKey) ?? []
    }

    private func save<T: Codable>(_ value: T, forKey key: String) {
        do {
            let data = try JSONEncoder().encode(value)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Save error: \(error)")
        }
    }

    private func load<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("Load error: \(error)")
            return nil
        }
    }
}
