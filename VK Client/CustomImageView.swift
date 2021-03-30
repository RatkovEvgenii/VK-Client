//
//  CustomImageView.swift
//  VK Client
//
//  Created by Admin on 03.01.2021.
//

import UIKit

class CustomImageView: UIView {
    var imageView: UIImageView? = nil
    var height: CGFloat = 0
    var width: CGFloat = 0
    
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
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(tuch(_:)))
        self.addGestureRecognizer(likeTapGesture)
        height = self.frame.height
        width = self.frame.width
        
    }
    @objc func tuch(_ sender: UIButton){
        print("tap")
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.bounds = CGRect(x: 10, y: 10, width: self.width - 10, height: self.height - 10)
                        
                        
                       })
        UIView.animate(withDuration: 0.2,
                       delay: 0.1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {

                        self.bounds = CGRect(x: -10, y: -10, width: self.width + 10, height: self.height + 10)
                       })
    }
    
}
