//
//  LoginViewController.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameInput.delegate = self
        self.passwordInput.delegate = self
        
        loginButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.username = nameInput.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    // MARK: - Handle UI elements
    
    @IBAction func loginBtnPressed() {
        guard let inputName = nameInput.text, !inputName.isEmpty else {
            showAlert(title: "Name field is empty!", message: "Please enter your name")
            return
        }
        
        guard let inputPassword = passwordInput.text, !inputPassword.isEmpty else {
            showAlert(title: "Password field is empty!", message: "Please enter your password")
            return
        }
    }
    
    @IBAction func nameInputChanged() {
        guard let nameEntry = nameInput.text, !nameEntry.isEmpty else {
            nameInput.enablesReturnKeyAutomatically = true
            return
        }
        
        nameInput.returnKeyType = .next
    }
    
    @IBAction func passwordInputChanged() {
        guard let passwordEntry = passwordInput.text, !passwordEntry.isEmpty else {
            passwordInput.enablesReturnKeyAutomatically = true
            return
        }
    }
    
    // MARK: - Handle segue unwind
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameInput.text = ""
        passwordInput.text = ""
    }
    
    
    // MARK: - Handle keyboard button
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInput:
            passwordInput.becomeFirstResponder()
        case passwordInput:
            performSegue(withIdentifier: "goToWelcome", sender: nil)
            
        default:
            break
        }
        return true
    }
}

// MARK: - Private methods

extension LoginViewController {
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

