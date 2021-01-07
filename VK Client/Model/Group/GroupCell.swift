//
//  GroupCell.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit

class GroupCell: UITableViewCell {
    @IBOutlet weak var groupIcon: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
