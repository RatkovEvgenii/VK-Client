//
//  ShareButton.swift
//  VK Client
//
//  Created by Admin on 27.02.2021.
//

import UIKit

@IBDesignable class ShareButton: UIView {

    private var shareImage: UIImageView? = nil
    private var countLabel: UILabel? = nil
    private var countOfShares: Int = 99
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
        shareImage = UIImageView(frame: CGRect(x: 0, y: 2, width: widthView / 2, height: self.frame.height - 2))
        shareImage?.image = UIImage(systemName: "arrowshape.turn.up.right")
        shareImage?.tintColor = UIColor.label
        countLabel = UILabel(frame: CGRect(x: widthView / 2, y: 0, width: widthView / 2, height: self.frame.height))
        countLabel?.text = String(countOfShares)
        countLabel?.textColor = UIColor.label
        countLabel?.textAlignment = .natural
        countLabel?.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(shareImage!)
        self.addSubview(countLabel!)
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(liked(_:)))
        self.addGestureRecognizer(likeTapGesture)
    }
    
    @objc private func liked(_ sender: UIButton) {
        if isPressed {
            shareImage?.image = UIImage(systemName: "arrowshape.turn.up.right")
            countLabel?.font = UIFont.systemFont(ofSize: 16)
            countOfShares -= 1
            isPressed = false
        } else {
            shareImage?.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
            countLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            countOfShares += 1
            isPressed = true
        }
        self.countLabel!.text = String(countOfShares)
    }

}
