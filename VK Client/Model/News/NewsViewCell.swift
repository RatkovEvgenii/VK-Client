//
//  NewsViewCell.swift
//  VK Client
//
//  Created by Admin on 21.02.2021.
//

import UIKit

class NewsViewCell: UITableViewCell {

  
    @IBOutlet weak var autorIcon: UIImageView!
    @IBOutlet weak var autorName: UILabel!
    @IBOutlet weak var newsPicture: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autorIcon.layer.cornerRadius = autorIcon.frame.height / 2
        autorIcon.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
