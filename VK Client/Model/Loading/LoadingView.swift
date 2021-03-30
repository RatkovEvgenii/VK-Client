//
//  LoadingView.swift
//  VK Client
//
//  Created by  Евгений Ратков on 11.03.21.
//

import UIKit

class LoadingView: UIView {
    var width: CGFloat = 0
    var height: CGFloat = 0
    var view1: UIView? = nil
    var view2: UIView? = nil
    var view3: UIView? = nil
    var view4: UIView? = nil
    var view5: UIView? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    func setupView() {
        width = self.frame.width
        height = self.frame.height
        let widthBig = (width - 3 * height) / 2
        backgroundColor = .clear
        view1 = UIView(frame: CGRect(x: 0, y: 0, width: height, height: height))
        view3 = UIView(frame: CGRect(x: (height + widthBig) , y: 0, width: height, height: height))
        view5 = UIView(frame: CGRect(x: (height * 2 + widthBig * 2) , y: 0, width: height, height: height))        
        self.view1?.backgroundColor = .darkGray
        self.view3?.backgroundColor = .lightGray
        self.view5?.backgroundColor = .gray
        view1?.layer.cornerRadius = self.frame.size.height / 2
        view1?.layer.masksToBounds = true
        view3?.layer.cornerRadius = self.frame.size.height / 2
        view3?.layer.masksToBounds = true
        view5?.layer.cornerRadius = self.frame.size.height / 2
        view5?.layer.masksToBounds = true
        addSubview(view1!)
        addSubview(view3!)
        addSubview(view5!)
        startAnimation()
    }
    
    func startAnimation() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: .repeat, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                self.view1?.backgroundColor = .gray
                self.view3?.backgroundColor = .darkGray
                self.view5?.backgroundColor = .lightGray
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.4) {
                self.view1?.backgroundColor = .lightGray
                self.view3?.backgroundColor = .gray
                self.view5?.backgroundColor = .darkGray
            }
        }, completion: nil)
    }
}
