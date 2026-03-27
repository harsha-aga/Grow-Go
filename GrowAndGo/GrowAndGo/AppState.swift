//
//  AppState.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class AppState: ObservableObject {
    @Published var childProfile: ChildProfile?
    @Published var progressRecords: [ProgressRecord] = []
    @Published var generatedStories: [GeneratedStory] = []

    private let storage = LocalStorageService()

    init() {
        childProfile = storage.loadProfile()
        progressRecords = storage.loadProgress()
        generatedStories = storage.loadStories()
    }

    func saveProfile(_ profile: ChildProfile) {
        childProfile = profile
        storage.saveProfile(profile)
    }

    func addProgress(_ record: ProgressRecord) {
        progressRecords.append(record)
        storage.saveProgress(progressRecords)
    }

    func saveGeneratedStory(_ story: GeneratedStory) {
        generatedStories.insert(story, at: 0)
        storage.saveStories(generatedStories)
    }
}
