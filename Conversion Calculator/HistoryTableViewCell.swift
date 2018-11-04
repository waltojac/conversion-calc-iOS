//
//  HistoryTableViewCell.swift
//  Conversion Calculator
//
//  Created by Jacob Walton on 11/4/18.
//  Copyright © 2018 Jake Walton. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var conversionLabel: UILabel!
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var timestampLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
