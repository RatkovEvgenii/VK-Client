//
//  NewsAuthorCell.swift
//  VK Client
//
//  Created by  Евгений Ратков on 28.12.21.
//

import UIKit

class NewsAuthorCell: UITableViewCell {

    
    @IBOutlet weak var authorAvatar: CustomImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
