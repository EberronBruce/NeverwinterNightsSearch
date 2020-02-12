//
//  DetailViewController.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/12/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var serverNameLabel: UILabel!
    @IBOutlet weak var passwordProtectLabel: UILabel!
    @IBOutlet weak var moduleNameLabel: UILabel!
    @IBOutlet weak var levelRangeLabel: UILabel!
    @IBOutlet weak var serverVaultLabel: UILabel!
    @IBOutlet weak var pvpLabel: UILabel!
    @IBOutlet weak var playersLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var portLabel: UILabel!
    
    var module : Module! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    private func setupView() {
        self.hostLabel.text = "\(module.host ?? NO_HOST) : "
        self.portLabel.text = module.port
        self.serverNameLabel.text = module.sessionName
        self.passwordProtectLabel.text = module.passworded
        self.moduleNameLabel.text = module.moduleName
        self.levelRangeLabel.text = "\(module.minLevel) to \(module.maxLevel)"
        self.serverVaultLabel.text = module.serverVault
        self.pvpLabel.text = module.pvp
        self.playersLabel.text = "\(module.numberOfCurrentPlayers)/\(module.maxPlayerNumber)"
        self.descriptionLabel.text = module.moduleDescription
        if module.moduleDescription.isEmpty {
            self.descriptionLabel.text = NO_DESCRIPTION
        }
        if module.passworded.isEmpty {
            self.passwordProtectLabel.isHidden = true
        }
        self.title = module.sessionName
    }
    

}
