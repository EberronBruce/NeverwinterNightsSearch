//
//  SearchTableViewCell.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var cellStyleView: UIView!
    @IBOutlet weak var sessionNameLabel: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellStyleView.layer.cornerRadius = 5.0
    }
    
    func configureCell(title text : String, numberText: String) {
        self.sessionNameLabel.text = text
        self.playerNumber.text = numberText
    }


}
