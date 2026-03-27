//
//  KidHomeView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct KidHomeView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if let profile = appState.childProfile {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Hi, \(profile.name)! 👋")
                                .font(.largeTitle.bold())
                            Text("Let’s learn something fun today.")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                    }

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        NavigationLink(destination: LettersView()) {
                            ModuleCard(topic: .letters)
                        }
                        NavigationLink(destination: NumbersView()) {
                            ModuleCard(topic: .numbers)
                        }
                        NavigationLink(destination: ColorsView()) {
                            ModuleCard(topic: .colors)
                        }
                        NavigationLink(destination: WritingView()) {
                            ModuleCard(topic: .writing)
                        }
                        NavigationLink(destination: MathView()) {
                            ModuleCard(topic: .math)
                        }
                        NavigationLink(destination: StoryGeneratorView()) {
                            ModuleCard(topic: .stories)
                        }
                    }

                    NavigationLink(destination: ParentGateView()) {
                        Text("Parent Corner")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding()
            }
            .navigationTitle("Learn & Play")
        }
    }
}

struct ModuleCard: View {
    let topic: LearningTopic

    var body: some View {
        VStack(spacing: 12) {
            Text(topic.emoji)
                .font(.system(size: 40))
            Text(topic.title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, minHeight: 130)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
