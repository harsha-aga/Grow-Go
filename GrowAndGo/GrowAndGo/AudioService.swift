//
//  AudioService.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import AVFoundation
import Foundation

final class AudioService: NSObject, AVSpeechSynthesizerDelegate {
    static let shared = AudioService()
    private let synthesizer = AVSpeechSynthesizer()

    private override init() {
        super.init()
        synthesizer.delegate = self
    }

    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = 0.45
        utterance.pitchMultiplier = 1.05
        synthesizer.speak(utterance)
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
