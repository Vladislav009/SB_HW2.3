//
//  WelcomeViewController.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    var username: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = username
    }
    
    @IBAction func logoutAction() {
        dismiss(animated: true)
    }
    
}
