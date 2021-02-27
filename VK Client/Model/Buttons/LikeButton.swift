//
//  LikeButton.swift
//  VK Client
//
//  Created by Admin on 25.02.2021.
//

import UIKit

@IBDesignable class LikeButton: UIView {

    private var heartImage: UIImageView? = nil
    private var countLabel: UILabel? = nil
    private var countOfLikes: Int = 99
    private var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        let widthView = self.frame.width
        heartImage = UIImageView(frame: CGRect(x: 0, y: 2, width: widthView / 2, height: self.frame.height - 2))
        heartImage?.image = UIImage(systemName: "heart")
      
        heartImage?.tintColor = UIColor.label
        countLabel = UILabel(frame: CGRect(x: widthView / 2, y: 0, width: widthView / 2, height: self.frame.height))
        countLabel?.text = String(countOfLikes)
        countLabel?.textColor = UIColor.label
        countLabel?.textAlignment = .natural
        countLabel?.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(heartImage!)
        self.addSubview(countLabel!)
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(liked(_:)))
        self.addGestureRecognizer(likeTapGesture)
    }
    
    @objc private func liked(_ sender: UIButton) {
        if isPressed {
            heartImage?.tintColor = UIColor.label
            heartImage?.image = UIImage(systemName: "heart")
            countLabel?.textColor = UIColor.label
            countLabel?.font = UIFont.systemFont(ofSize: 16)
            countOfLikes -= 1
            isPressed = false
        } else {
            heartImage?.tintColor = UIColor.red
            heartImage?.image = UIImage(systemName: "heart.fill")
            countLabel?.textColor = UIColor.red
            countLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            countOfLikes += 1
            isPressed = true
        }
        self.countLabel!.text = String(countOfLikes)
    }
}
