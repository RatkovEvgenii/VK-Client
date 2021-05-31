//
//  CustomImageViewWithSlideAnimate.swift
//  VK Client
//
//  Created by  Евгений Ратков on 1.06.21.
//

import UIKit

class CustomImageViewWithSlideAnimate: UIView {

    var imageView: UIImageView? = nil
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    var images: [UIImage] = [UIImage(systemName: "heart")!, UIImage(systemName: "pencil")!, UIImage(systemName: "tray")!, UIImage(systemName: "doc")!, UIImage(systemName: "book")!]
    var index: Int = 0
    
    func  setImage(i: Int){
        index = i

        imageView?.image = images[index]
  
    }
    func  setImages(_ newImages: [UIImage]){
        
        images = newImages
    }
    
    func addImage(newImage: UIImage){
        images.append(newImage)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(tuch(_:)))
        
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        swipeRightRecognizer.direction = .right
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
        swipeLeftRecognizer.direction = .left
        self.addGestureRecognizer(swipeRightRecognizer)
        self.addGestureRecognizer(swipeLeftRecognizer)
        height = self.frame.height
        width = self.frame.width
        imageView = UIImageView(frame: self.bounds)
        setImage(i: 0)
        imageView?.backgroundColor = .green
        self.addSubview(imageView!)
        
        
        
       
    }
    
    @objc func swipeRight(_ sender: UIButton){
        print("swipe right" )
        if (self.index - 1) >= 0 {
            UIView.transition(with: imageView!,
                              duration: 0.25,
                              options: .transitionFlipFromLeft,
                              animations: {
                                self.imageView?.image = self.images[self.index - 1]
                                self.index -= 1
                              })
        }
    }
    @objc func swipeLeft(_ sender: UIButton){
        print("swipe left")
        if (self.index + 1) <= self.images.count - 1{
            UIView.transition(with: imageView!,
                              duration: 0.25,
                              options: .transitionFlipFromRight,
                              animations: {
                                self.imageView?.image = self.images[self.index + 1]
                                self.index += 1
                              })
        }
    }
    
    
   
    
    override func draw(_ rect: CGRect) {
    }
}
