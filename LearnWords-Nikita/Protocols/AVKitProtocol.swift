//
//  AVKitProtocol.swift
//  LearnWords-Nikita
//
//  Created by macbook on 10.10.2023.
//

import AVKit


protocol AVKitProtocol: AnyObject, AVSpeechSynthesizerDelegate {
    var synthesizer: AVSpeechSynthesizer! { get set }
}

extension AVKitProtocol {
    func playSound(_ string: String?,language: String = "en-US") {
        
        guard let string = string, !string.isEmpty else { return }
        
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = 0.4
        utterance.volume = 1.0
        
        if synthesizer == nil {
            synthesizer = .init()
            synthesizer?.delegate = self.self
        }
        
        synthesizer.speak(utterance)
    }
}
