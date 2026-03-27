//
//  OnboardingView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appState: AppState

    @State private var childName = ""
    @State private var selectedAge: AgeGroup = .fourToFive
    @State private var topics: Set<LearningTopic> = Set(LearningTopic.allCases)

    var body: some View {
        NavigationStack {
            Form {
                Section("Child Profile") {
                    TextField("Child name", text: $childName)
                    Picker("Age Group", selection: $selectedAge) {
                        ForEach(AgeGroup.allCases) { group in
                            Text(group.rawValue).tag(group)
                        }
                    }
                }

                Section("Learning Topics") {
                    ForEach(LearningTopic.allCases) { topic in
                        Toggle(isOn: Binding(
                            get: { topics.contains(topic) },
                            set: { isOn in
                                if isOn { topics.insert(topic) } else { topics.remove(topic) }
                            }
                        )) {
                            Text("\(topic.emoji) \(topic.title)")
                        }
                    }
                }

                Button("Start Learning") {
                    let profile = ChildProfile(
                        name: childName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Little Learner" : childName,
                        ageGroup: selectedAge,
                        enabledTopics: topics.isEmpty ? LearningTopic.allCases : Array(topics)
                    )
                    appState.saveProfile(profile)
                }
            }
            .navigationTitle("BrightPath Kids")
        }
    }
}
