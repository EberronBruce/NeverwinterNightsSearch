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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
