//
//  CommentButton.swift
//  VK Client
//
//  Created by Admin on 27.02.2021.
//

import UIKit

@IBDesignable class CommentButton: UIView {

    private var comentImage: UIImageView? = nil
    private var countLabel: UILabel? = nil
    private var countOfComments: Int = 99
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
        comentImage = UIImageView(frame: CGRect(x: 0, y: 2, width: widthView / 2, height: self.frame.height - 2))
        comentImage?.image = UIImage(systemName: "bubble.left")
        comentImage?.tintColor = UIColor.label
        countLabel = UILabel(frame: CGRect(x: widthView / 2, y: 0, width: widthView / 2, height: self.frame.height))
        countLabel?.text = String(countOfComments)
        countLabel?.textColor = UIColor.label
        countLabel?.textAlignment = .natural
        countLabel?.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(comentImage!)
        self.addSubview(countLabel!)
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(liked(_:)))
        self.addGestureRecognizer(likeTapGesture)
    }
    
    @objc private func liked(_ sender: UIButton) {
        if isPressed {
            comentImage?.image = UIImage(systemName: "bubble.left")
            countLabel?.font = UIFont.systemFont(ofSize: 16)
            countOfComments -= 1
            isPressed = false
        } else {
            comentImage?.image = UIImage(systemName: "bubble.left.fill")
            countLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            countOfComments += 1
            isPressed = true
        }
        self.countLabel!.text = String(countOfComments)
    }
}
