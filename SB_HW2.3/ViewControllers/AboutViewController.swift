//
//  AboutViewController.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 18.07.2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutTF: UILabel!
    
    var about = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutTF.text = about
        
    }
    

}
