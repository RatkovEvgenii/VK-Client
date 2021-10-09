//
//  CustomImageViewWithSlideAnimate.swift
//  VK Client
//
//  Created by  Евгений Ратков on 1.06.21.
//

import UIKit

class CustomImageViewWithSlideAnimate: UIView {

    var firstImageView: UIImageView? = nil
    //var secondImageView: UIImageView? = nil
    var isFirstImageOnScreen = true
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    var images: [UIImage] = [UIImage(systemName: "heart")!, UIImage(systemName: "pencil")!, UIImage(systemName: "tray")!, UIImage(systemName: "doc")!, UIImage(systemName: "book")!, UIImage(systemName: "heart")!, UIImage(systemName: "pencil")!, UIImage(systemName: "tray")!, UIImage(systemName: "doc")!, UIImage(systemName: "book")!]
    var index: Int = 0
    
    func  setImage(i: Int){
        index = i
        firstImageView?.image = images[index]
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
        firstImageView = UIImageView(frame: self.bounds)
        setImage(i: 0)
        firstImageView?.backgroundColor = .green
        self.addSubview(firstImageView!)
        //secondImageView = UIImageView(frame: CGRect(x: width + 5, y: 0, width: width, height: height))
        //secondImageView?.backgroundColor = .red
        // self.addSubview(secondImageView!)
        // self.secondImageView?.layer.zPosition = 2
         //self.firstImageView?.layer.zPosition = 1
        
       
    }
    
    @objc func swipeRight(_ sender: UIButton){
        print("swipe right" )
        if (self.index - 1) >= 0 {
            UIView.transition(with: firstImageView!,
                              duration: 0.25,
                              options: .transitionFlipFromLeft,
                              animations: {
                                self.firstImageView?.image = self.images[self.index - 1]
                                self.index -= 1
                              })
        }
    }
    @objc func swipeLeft(_ sender: UIButton){
        print("swipe left")
        if (self.index + 1) <= self.images.count - 1{
            UIView.transition(with: firstImageView!,
                              duration: 0.25,
                              options: .transitionFlipFromRight,
                              animations: {
                                self.firstImageView?.image = self.images[self.index + 1]
                                self.index += 1
                              })
        }
    }
    
    
    override func draw(_ rect: CGRect) {
    }
    
//    @objc func swipeRight(_ sender: UIButton){
//        print("swipe right" )
//        if (self.index - 1) >= 0 {
//
//            UIView.transition(with: imageView!,
//                              duration: 0.25,
//                              options: .transitionFlipFromLeft,
//                              animations: {
//                                self.imageView?.image = self.images[self.index - 1]
//                                self.index -= 1
//                              })
//        }
//    }
//    @objc func swipeLeft(_ sender: UIButton){
//        print("swipe left")
//        if (self.index + 1) <= self.images.count - 1{
//
//            self.secondImageView?.layer.zPosition = 1
//            self.firstImageView?.layer.zPosition = 2
//            self.secondImageView?.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
//            self.secondImageView!.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
//            if isFirstImageOnScreen {
//                secondImageView?.image = images[index-1]
//                UIView.animateKeyframes(withDuration: 2,
//                                        delay: 0,
//                                        options: [],
//                                        animations: {
//                                            UIView.addKeyframe(withRelativeStartTime: 0,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.firstImageView?.frame = CGRect(x: self.width + 5, y: 0, width: self.width, height: self.height)
//
//                                                               })
//                                            UIView.addKeyframe(withRelativeStartTime: 0.5,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.secondImageView?.transform = .identity
//                                                               })
//
//                                        },
//                                        completion: {_ in
//                                            self.firstImageView?.frame = CGRect(x: self.width + 10, y: 0, width: self.width, height: self.height)
//                                            self.firstImageView!.transform = .identity
//                                            self.secondImageView?.layer.zPosition = 1
//                                            self.firstImageView?.layer.zPosition = 2
//                                        })
//
//
//            } else {
//                firstImageView?.image = images[index+1]
//
//                UIView.animateKeyframes(withDuration: 2,
//                                        delay: 0,
//                                        options: [],
//                                        animations: {
//                                            UIView.addKeyframe(withRelativeStartTime: 0,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.secondImageView!.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
//
//                                                               })
//                                            UIView.addKeyframe(withRelativeStartTime: 0.5,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.firstImageView?.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
//                                                               })
//
//                                        },
//                                        completion: {_ in
//                                            self.secondImageView?.layer.zPosition = 2
//                                            self.firstImageView?.layer.zPosition = 1
//                                            self.secondImageView?.frame = CGRect(x: self.width + 10, y: 0, width: self.width, height: self.height)
//                                            self.secondImageView!.transform = .identity
//                                        })
//
//            }
//            self.index += 1
//            isFirstImageOnScreen = !isFirstImageOnScreen
//        }
//    }
//    @objc func swipeLeft(_ sender: UIButton){
//        print("swipe left")
//        if (self.index + 1) <= self.images.count - 1{
//            if isFirstImageOnScreen {
//                secondImageView?.image = images[index+1]
//                UIView.animateKeyframes(withDuration: 2,
//                                        delay: 0,
//                                        options: [],
//                                        animations: {
//                                            UIView.addKeyframe(withRelativeStartTime: 0,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.firstImageView!.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
//
//                                                               })
//                                            UIView.addKeyframe(withRelativeStartTime: 0.5,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.secondImageView?.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
//                                                               })
//
//                                        },
//                                        completion: {_ in
//                                            self.firstImageView?.frame = CGRect(x: self.width + 5, y: 0, width: self.width, height: self.height)
//                                            self.firstImageView!.transform = .identity
//                                            self.secondImageView?.layer.zPosition = 1
//                                            self.firstImageView?.layer.zPosition = 2
//                                        })
//
//
//            } else {
//                firstImageView?.image = images[index+1]
//
//                UIView.animateKeyframes(withDuration: 2,
//                                        delay: 0,
//                                        options: [],
//                                        animations: {
//                                            UIView.addKeyframe(withRelativeStartTime: 0,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.secondImageView!.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
//
//                                                               })
//                                            UIView.addKeyframe(withRelativeStartTime: 0.5,
//                                                               relativeDuration: 0.5,
//                                                               animations: {
//                                                                self.firstImageView?.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
//                                                               })
//
//                                        },
//                                        completion: {_ in
//                                            self.secondImageView?.layer.zPosition = 2
//                                            self.firstImageView?.layer.zPosition = 1
//                                            self.secondImageView?.frame = CGRect(x: self.width + 5, y: 0, width: self.width, height: self.height)
//                                            self.secondImageView!.transform = .identity
//                                        })
//
//            }
//            self.index += 1
//            isFirstImageOnScreen = !isFirstImageOnScreen
//        }
//
//    }
}
