//
//  CustomImageView.swift
//  VK Client
//
//  Created by Admin on 03.01.2021.
//

import UIKit

class CustomImageView: UIView {
    var imageView: UIImageView? = nil
    
    func  setImage(_ newImage: UIImage){
        imageView = UIImageView(frame: self.bounds)
        imageView?.image = newImage
        imageView?.layer.cornerRadius = self.frame.size.height / 2
        imageView?.layer.masksToBounds = true
        self.backgroundColor = .clear
        self.addSubview(imageView!)
    }
    
    
    override func draw(_ rect: CGRect) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 12
        layer.shadowOpacity = 1.0
    }
}
