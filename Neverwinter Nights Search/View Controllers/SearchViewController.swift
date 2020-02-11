//
//  ViewController.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewController()
    }
    
    private func setupViewController() {
        tableView.delegate = self
        tableView.dataSource = self
    }


    @IBAction func infoButtonTapped(_ sender: UIButton) {
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? SearchTableViewCell {
            cell.configureCell(title: "test", numberText: "test")
            return cell
        } else {
            return SearchTableViewCell()
        }
    }
    
    
}
