//
//  ViewController.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISplitViewControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorHolderView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var modules = [Module]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    private func setupViewController() {
        tableView.delegate = self
        tableView.dataSource = self
        
        self.splitViewController?.delegate = self
        
        self.splitViewController?.preferredDisplayMode = .allVisible
        self.extendedLayoutIncludesOpaqueBars = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(actOnNotification(_:)), name: NOTIFY_API_FINISHED, object: nil)
    }
    
    private func getData() {
        let dataService = DataService()
        dataService.getDataFromApi()
    }
    
    @objc func actOnNotification(_ notfication: Notification) {
        DispatchQueue.main.async {
            if let data = notfication.userInfo as? [String: [Module]], let modules = data[KEY_NWN] {
                if modules.isEmpty {
                    self.getData()
                    return
                }
                self.modules = modules.sorted(by: {$0.playerNumber > $1.playerNumber})
                self.spinner.stopAnimating()
                self.indicatorHolderView.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return false
    }

    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? SearchTableViewCell {
            if let title = modules[indexPath.row].sessionName{
                cell.configureCell(title: title, numberText: modules[indexPath.row].numberOfCurrentPlayers)
            }
            
            return cell
        } else {
            return SearchTableViewCell()
        }
    }
    
    
}
