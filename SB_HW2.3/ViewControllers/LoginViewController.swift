//
//  LoginViewController.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let user = User.getUser()
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInput.delegate = self
        passwordInput.delegate = self
        
        loginButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = nameInput.text
            }
            
            if let aboutVC = viewController as? AboutViewController {
                aboutVC.about = user.description
            }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    // MARK: - Handle UI elements
    
    @IBAction func loginBtnPressed() {
        if nameInput.text != user.username || passwordInput.text != user.password {
            showAlert(title: "Ooops!", message: "Wrong name or password!")
            passwordInput.text = ""
        }
        
        performSegue(withIdentifier: "goToWelcome", sender: nil)
    }
    
    @IBAction func nameInputChanged() {
        nameInput.returnKeyType = .next
        guard let nameEntry = nameInput.text, !nameEntry.isEmpty else {
            nameInput.enablesReturnKeyAutomatically = true
            return
        }
    }
    
    @IBAction func passwordInputChanged() {
        guard let passwordEntry = passwordInput.text, !passwordEntry.isEmpty else {
            passwordInput.enablesReturnKeyAutomatically = true
            return
        }
    }
    
    
    @IBAction func forgotUsernamePressed() {
        showAlert(title: "Your username 😉", message: "Your username is \(user.username)")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Your password 😉", message: "Your password is \(user.password)")
    }
    
    
    
    // MARK: - Handle segue unwind
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameInput.text = ""
        passwordInput.text = ""
    }
    
    // MARK: - Handle keyboard button
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameInput {
            passwordInput.becomeFirstResponder()
            return true
        }
        
        loginBtnPressed()
        
        return true
    }
    
}

// MARK: - Private methods

extension LoginViewController {
    private func showAlert(title: String, message: String){
        let alert = AlertView.generateAlert(title: title, message: message)
        present(alert, animated: true)
    }
}

