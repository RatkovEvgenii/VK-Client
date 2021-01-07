//
//  Login2.swift
//  VK Client
//
//  Created by Admin on 02.01.2021.
//

import UIKit

class Login2: UIViewController {

//    @IBOutlet weak var myScrollView: UIScrollView!
//    @IBOutlet weak var loginTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Жест нажатия
               let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
               // Присваиваем его UIScrollVIew
        myScrollView?.addGestureRecognizer(hideKeyboardGesture)
        // Do any additional setup after loading the view.
    }
    
  

    @IBAction func logBut(_ sender: Any) {
        let login = loginTextField.text!
                // Получаем текст-пароль
                let password = passwordTextField.text!
        
                // Проверяем, врны ли они
                if login == "admin" && password == "123456" {
                    print("успешная авторизация")
                } else {
                    print("неуспешная авторизация")
                }
    }
    //    @IBAction func loginButtom(_ sender: Any) {
//        let login = loginTextField.text!
//        // Получаем текст-пароль
//        let password = passwordTextField.text!
//
//        // Проверяем, врны ли они
//        if login == "admin" && password == "123456" {
//            print("успешная авторизация")
//        } else {
//            print("неуспешная авторизация")
//        }
//    }
//

    // Do any additional setup after loading the view.

override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        if login == "admin" && password == "123456" {
                return true
            } else {
                // Создаем контроллер
                let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
                // Создаем кнопку для UIAlertController
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                // Добавляем кнопку на UIAlertController
                alert.addAction(action)
                // Показываем UIAlertController
                present(alert, animated: true, completion: nil)
                
                return false
            }

    }


@objc func keyboardWasShown(notification: Notification) {
       
       // Получаем размер клавиатуры
       let info = notification.userInfo! as NSDictionary
       let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
       let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
       
       // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
       self.myScrollView?.contentInset = contentInsets
    myScrollView?.scrollIndicatorInsets = contentInsets
   }
   
   //Когда клавиатура исчезает
   @objc func keyboardWillBeHidden(notification: Notification) {
       // Устанавливаем отступ внизу UIScrollView, равный 0
       let contentInsets = UIEdgeInsets.zero
    myScrollView?.contentInset = contentInsets
   }


override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

@objc func hideKeyboard() {
        self.myScrollView.endEditing(true)
    }


override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
       NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
       // Второе — когда она пропадает
       NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
   }



}


