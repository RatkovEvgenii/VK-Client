
import UIKit

@IBDesignable class LikeButtom: UIControl {
    private var button: UIButton? = nil
    private var label: UILabel? = nil
    private var stackView: UIStackView!
    private var countOfLikes: Int = 0
    private var views: [UIView] = []
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
        button = UIButton(type: .system)
        //button.setTitle("day.title", for: .normal)
        button!.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button!.setTitleColor(.lightGray, for: .normal)
        button!.setTitleColor(.white, for: .selected)
        button!.tintColor = UIColor.blue
        button!.addTarget(self, action: #selector(liked(_:)), for: .touchUpInside)
        label = UILabel()
        label!.text = "0"
        views.append(button!)
        views.append(label!)
        
        stackView = UIStackView(arrangedSubviews: self.views)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc private func liked(_ sender: UIButton) {
        if isPressed {
            button?.tintColor = UIColor.blue
            countOfLikes -= 1
            isPressed = false
        } else {
            button?.tintColor = UIColor.red
            countOfLikes += 1
            isPressed = true
        }
        self.label!.text = String(countOfLikes)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }

}

//enum Day: Int {
//    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
//
//    static let allDays: [Day] = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
//
//    var title: String {
//        switch self {
//        case .monday: return "ПН"
//        case .tuesday: return "ВТ"
//        case .wednesday: return "СР"
//        case .thursday: return "ЧТ"
//        case .friday: return "ПТ"
//        case .saturday: return "СБ"
//        case .sunday: return "ВС"
//        }
//    }
//}
//
//@IBDesignable class WeekDayPicker: UIControl {
//
//    var selectedDay: Day? = nil {
//        didSet {
//            self.updateSelectedDay()
//            self.sendActions(for: .valueChanged)
//        }
//    }
//
//    private var buttons: [UIButton] = []
//    private var stackView: UIStackView!
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setupView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setupView()
//    }
//
//    private func setupView() {
//        for day in Day.allDays {
//            let button = UIButton(type: .system)
//            button.setTitle(day.title, for: .normal)
//            button.setTitleColor(.lightGray, for: .normal)
//            button.setTitleColor(.white, for: .selected)
//            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
//            self.buttons.append(button)
//        }
//
//        stackView = UIStackView(arrangedSubviews: self.buttons)
//
//        self.addSubview(stackView)
//
//        stackView.spacing = 8
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillEqually
//    }
//
//    private func updateSelectedDay() {
//        for (index, button) in self.buttons.enumerated() {
//            guard let day = Day(rawValue: index) else { continue }
//            button.isSelected = day == self.selectedDay
//        }
//    }
//
//    @objc private func selectDay(_ sender: UIButton) {
//        guard let index = self.buttons.index(of: sender) else { return }
//        guard let day = Day(rawValue: index) else { return }
//        self.selectedDay = day
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        stackView.frame = bounds
//    }
//
//}
//

/*
 //
 //  LikeButton.swift
 //  VK Client
 //
 //  Created by Admin on 25.02.2021.
 //

 import UIKit

 @IBDesignable class LikeButton: UIView {

     private var button: UIButton? = nil
     private var label: UILabel? = nil
     private var stackView: UIStackView!
     private var countOfLikes: Int = 0
     private var views: [UIView] = []
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
         
         button = UIButton(type: .system)
         //button.setTitle("day.title", for: .normal)
         button!.setImage(UIImage(systemName: "heart.fill"), for: .normal)
         button!.setTitleColor(.lightGray, for: .normal)
         button!.setTitleColor(.white, for: .selected)
         button!.tintColor = UIColor.blue
         
         label = UILabel()
         label!.text = "0"
         views.append(button!)
         views.append(label!)
         
         stackView = UIStackView(arrangedSubviews: self.views)
         stackView.spacing = 0
         stackView.axis = .horizontal
         stackView.alignment = .fill
         stackView.distribution = .fillProportionally
         let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(liked(_:)))
         self.addGestureRecognizer(likeTapGesture)
         
         self.addSubview(stackView)
     }
     
     @objc private func liked(_ sender: UIButton) {
         if isPressed {
             button?.tintColor = UIColor.blue
             countOfLikes -= 1
             isPressed = false
         } else {
             button?.tintColor = UIColor.red
             countOfLikes += 1
             isPressed = true
         }
         self.label!.text = String(countOfLikes)
     }
     
     override func layoutSubviews() {
         super.layoutSubviews()
         stackView.frame = bounds
     }



 //enum Day: Int {
 //    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
 //
 //    static let allDays: [Day] = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
 //
 //    var title: String {
 //        switch self {
 //        case .monday: return "ПН"
 //        case .tuesday: return "ВТ"
 //        case .wednesday: return "СР"
 //        case .thursday: return "ЧТ"
 //        case .friday: return "ПТ"
 //        case .saturday: return "СБ"
 //        case .sunday: return "ВС"
 //        }
 //    }
 //}
 //
 //@IBDesignable class WeekDayPicker: UIControl {
 //
 //    var selectedDay: Day? = nil {
 //        didSet {
 //            self.updateSelectedDay()
 //            self.sendActions(for: .valueChanged)
 //        }
 //    }
 //
 //    private var buttons: [UIButton] = []
 //    private var stackView: UIStackView!
 //
 //    override init(frame: CGRect) {
 //        super.init(frame: frame)
 //        self.setupView()
 //    }
 //
 //    required init?(coder aDecoder: NSCoder) {
 //        super.init(coder: aDecoder)
 //        self.setupView()
 //    }
 //
 //    private func setupView() {
 //        for day in Day.allDays {
 //            let button = UIButton(type: .system)
 //            button.setTitle(day.title, for: .normal)
 //            button.setTitleColor(.lightGray, for: .normal)
 //            button.setTitleColor(.white, for: .selected)
 //            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
 //            self.buttons.append(button)
 //        }
 //
 //        stackView = UIStackView(arrangedSubviews: self.buttons)
 //
 //        self.addSubview(stackView)
 //
 //        stackView.spacing = 8
 //        stackView.axis = .horizontal
 //        stackView.alignment = .center
 //        stackView.distribution = .fillEqually
 //    }
 //
 //    private func updateSelectedDay() {
 //        for (index, button) in self.buttons.enumerated() {
 //            guard let day = Day(rawValue: index) else { continue }
 //            button.isSelected = day == self.selectedDay
 //        }
 //    }
 //
 //    @objc private func selectDay(_ sender: UIButton) {
 //        guard let index = self.buttons.index(of: sender) else { return }
 //        guard let day = Day(rawValue: index) else { return }
 //        self.selectedDay = day
 //    }
 //
 //    override func layoutSubviews() {
 //        super.layoutSubviews()
 //        stackView.frame = bounds
 //    }
 //
 //}
 //



 }

 */
