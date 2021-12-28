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
    var images: [UIImage] = []
    
    func onlineShadow(){
        layer.shadowColor = UIColor.green.cgColor
    }
    
    func  setImage(_ newImage: UIImage){
        imageView = UIImageView(frame: self.bounds)
        imageView?.image = newImage
        imageView?.layer.cornerRadius = self.frame.size.height / 2
        imageView?.layer.masksToBounds = true
        backgroundColor = .clear
        self.addSubview(imageView!)
        
    
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    override func draw(_ rect: CGRect) {
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shadowOpacity = 1.0
        
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(tuch(_:)))
        self.addGestureRecognizer(likeTapGesture)
        height = self.frame.height
        width = self.frame.width
        
    }
    @objc func tuch(_ sender: UIButton){
        print("tap")
//        UIView.animate(withDuration: 0.2,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: [],
//                       animations: {
//                        self.bounds = CGRect(x: 10, y: 10, width: self.width - 10, height: self.height - 10)
//
//
//                       })
//        UIView.animate(withDuration: 0.2,
//                       delay: 0.1,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: [],
//                       animations: {
//
//                        self.bounds = CGRect(x: -10, y: -10, width: self.width + 10, height: self.height + 10)
//                       })
        
//        let animation = CASpringAnimation(keyPath: "transform.scale")
//            animation.fromValue = 0
//            animation.toValue = 1
//            animation.stiffness = 200
//            animation.mass = 2
//            animation.duration = 2
//            animation.beginTime = CACurrentMediaTime() + 1
//            animation.fillMode = CAMediaTimingFillMode.backwards
//
//            self.layer.add(animation, forKey: nil)
        
        //сжимание
//        UIView.animate(withDuration: 0.125,
//            animations: {
//                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
//            },
//            completion: { _ in
//                UIView.animate(withDuration: 0.125) {
//                    self.transform = CGAffineTransform.identity
//                }
//            })
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                options: [],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.5,
                                                       animations: {
                                                        self.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
                                                       })
                                 
                                },
                                completion: nil)

        

    }
    
}
