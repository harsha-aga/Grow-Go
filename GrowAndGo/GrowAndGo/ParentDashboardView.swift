//
//  ParentDashboardView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct ParentDashboardView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        List {
            if let profile = appState.childProfile {
                Section("Child") {
                    Text("Name: \(profile.name)")
                    Text("Age Group: \(profile.ageGroup.rawValue)")
                    Text("Topics: \(profile.enabledTopics.map(\.title).joined(separator: ", "))")
                }
            }

            Section("Progress") {
                ForEach(appState.progressRecords) { record in
                    VStack(alignment: .leading) {
                        Text(record.title)
                            .font(.headline)
                        Text(record.topic.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            Section("Generated Stories") {
                ForEach(appState.generatedStories) { story in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(story.response.title)
                            .font(.headline)
                        Text("Topic: \(story.promptTopic) | Theme: \(story.promptTheme)")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Parent Dashboard")
    }
}
