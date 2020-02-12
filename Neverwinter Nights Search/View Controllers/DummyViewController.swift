//
//  DummyViewController.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/12/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class DummyViewController: UIViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        // Do any additional setup after loading the view.
        
        self.splitViewController?.preferredDisplayMode = .allVisible
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationController?.popViewController(animated: true)
    }
    


}
