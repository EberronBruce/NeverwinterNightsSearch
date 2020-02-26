//
//  CreditsViewController.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {
    @IBOutlet weak var dancingFoxButton: UIButton!
    @IBOutlet weak var beamDogButton: UIButton!
    @IBOutlet weak var redRavenButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        containerView.layer.cornerRadius = STYLE_BORDER_RADIUS
        setupButtonStyles()
    }
    
    private func setupButtonStyles() {
        self.dancingFoxButton.titleLabel!.attributedText = NSAttributedString(string: WEBSITE_DANCINFOX, attributes: [.underlineStyle : NSUnderlineStyle.single.rawValue])
        self.beamDogButton.titleLabel!.attributedText = NSAttributedString(string: WEBSITE_DANCINFOX, attributes: [.underlineStyle : NSUnderlineStyle.single.rawValue])
        self.redRavenButton.titleLabel!.attributedText = NSAttributedString(string: WEBSITE_DANCINFOX, attributes: [.underlineStyle : NSUnderlineStyle.single.rawValue])
    }
    

    @IBAction func dancingFoxTapped(_ sender: UIButton) {
        if let url = URL(string: WEBSITE_DANCINFOX) {
            goToSafari(url: url)
        }
    }
    
    @IBAction func redRavenTapped(_ sender: UIButton) {
        if let url = URL(string: WEBSITE_REDRAVEN){
            goToSafari(url: url)
        }
    }
    
    @IBAction func beamDogTapped(_ sender: Any) {
        if let url = URL(string: WEBSITE_BEAMDOG) {
            goToSafari(url: url)
        }
    }
    
    private func goToSafari(url: URL) {
        UIApplication.shared.open(url)
    }
    
}
