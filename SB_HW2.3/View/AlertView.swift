//
//  AlertView.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 19.07.2021.
//

import UIKit

class AlertView: UIView {

    public static func generateAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        
        return alert
    }

}
