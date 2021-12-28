//
//  NewsButtonsCell.swift
//  VK Client
//
//  Created by  Евгений Ратков on 28.12.21.
//

import UIKit

class NewsButtonsCell: UITableViewCell {

    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentButton: CommentButton!
    @IBOutlet weak var shareButton: ShareButton!
    @IBOutlet weak var countOfView: CountOfViews!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
