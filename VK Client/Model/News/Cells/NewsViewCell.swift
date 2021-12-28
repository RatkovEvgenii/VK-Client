//
//  NewsViewCell.swift
//  VK Client
//
//  Created by Admin on 21.02.2021.
//

import UIKit

class NewsViewCell: UITableViewCell {

  
    @IBOutlet weak var autorAvatar: CustomImageView!
    
    @IBOutlet weak var autorName: UILabel!
    @IBOutlet weak var newsImages: CustomImageViewWithSlideAnimate!
    var displayWidth: CGFloat = 0
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        //displayWidth = self.bounds.width
        
    }

    func customInit( width: CGFloat){
        print("!!!cell width = ",width)
        newsImages.customInit(width: width)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
