//
//  CommonFunctions.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(with message: String) {
        let alert = UIAlertController.init(title: "Alert", message: message, preferredStyle: .alert)
        
        let alertDoneAction = UIAlertAction.init(title: "Done", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertDoneAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}
