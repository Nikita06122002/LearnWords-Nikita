//
//  ViewController.swift
//  LearnWords-Nikita
//
//  Created by macbook on 24.09.2023.
//

import UIKit
import AVKit

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    lazy var synthesizer: AVSpeechSynthesizer = {
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = self
        return synthesizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .custom.white
    }
    
    
    func alert(title: String?, message: String?, actionTitle: String?, action: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cloused = UIAlertAction(title: "Закрыть", style: .cancel)
        
        if let action = action {
            let newButton = UIAlertAction(title: actionTitle, style: .default, handler: action)
            alert.addAction(newButton)
        }
        
        
        alert.addAction(cloused)
        self.present(alert, animated: true, completion: nil)
    }
    
}
