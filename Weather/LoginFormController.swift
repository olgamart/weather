//
//  LoginFormController.swift
//  Weather
//
//  Created by Olga Martyanova on 18/07/2018.
//  Copyright © 2018 olgamart. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        // присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if login == "admin" && password == "12345" {
            print ("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }
    // когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        
        // добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // устанавливаем отступ внизу UIScrollView равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        if !checkResult {
            showLoginError()
        }
        return checkResult
        
    }
    
    func checkUserData() -> Bool {
        let login = loginInput.text!
        let password = passwordInput.text!
        if login == "admin" && password == "12345"{
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }

}
