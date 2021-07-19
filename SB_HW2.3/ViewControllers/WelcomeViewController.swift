//
//  WelcomeViewController.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var welcomeTitle: UINavigationItem!
    @IBOutlet weak var logoutButton: UIButton!
    
    var username: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 10

        usernameLabel.text = "Hi \(username ?? "User")"
        welcomeTitle.title = "Hi \(username ?? "User")"
    }
}

