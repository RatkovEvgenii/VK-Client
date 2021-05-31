//
//  UserCell.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
  //  @IBOutlet weak var userAvatar: UIImageView!
    //@IBOutlet weak var userAvatar: CustomImageView!
    @IBOutlet weak var userAvatar: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
