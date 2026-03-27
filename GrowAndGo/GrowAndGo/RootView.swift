//
//  RootView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        Group {
            if appState.childProfile == nil {
                OnboardingView()
            } else {
                KidHomeView()
            }
        }
    }
}
