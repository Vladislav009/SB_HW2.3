//
//  GeneralInfoViewController.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 19.07.2021.
//

import UIKit

class GeneralInfoViewController: UIViewController {

    
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var passwordTF: UILabel!
    @IBOutlet weak var ageTF: UILabel!
    @IBOutlet weak var cityTF: UILabel!
    
    public var name: String = ""
    public var password: String = ""
    public var age: String = ""
    public var city: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.text = name
        passwordTF.text = password
        ageTF.text = age
        cityTF.text = city
        
    }
    

    

}
