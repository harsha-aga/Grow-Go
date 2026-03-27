//
//  WritingView.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import SwiftUI

struct WritingView: View {
    @EnvironmentObject private var appState: AppState
    @State private var points: [CGPoint] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("Trace Here")
                .font(.largeTitle.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.secondarySystemBackground))
                    .frame(height: 320)

                Path { path in
                    guard let first = points.first else { return }
                    path.move(to: first)
                    for point in points.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                .stroke(lineWidth: 8)
                .frame(height: 320)
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        points.append(value.location)
                    }
            )

            HStack {
                Button("Clear") {
                    points.removeAll()
                }
                .buttonStyle(.bordered)

                Button("Done") {
                    appState.addProgress(.init(topic: .writing, title: "Tracing Practice", score: points.count > 15 ? 1.0 : 0.5))
                    AudioService.shared.speak("Great job tracing")
                    points.removeAll()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .navigationTitle("Trace & Write")
    }
}
