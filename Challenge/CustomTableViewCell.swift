//
//  CustomTableViewCell.swift
//  Challenge
//
//  Created by Nathaniel Whittington on 6/5/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
