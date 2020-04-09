//
//  Utility.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 08/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import Foundation
import  UIKit

struct Utility {
    
    static func showAlert(toController controller: UIViewController, withTitle title: String?, withMessage message: String?){
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "Okay", style: .default, handler: nil))
        alertController.restorationIdentifier = "alert"
        controller.present(alertController, animated: true, completion: nil)
    }
}
