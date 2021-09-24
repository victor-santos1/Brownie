//
//  Alert.swift
//  Brownie
//
//  Created by Victor on 23/09/21.
//

import UIKit

class Alert {
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func show(title: String = "Desculpe", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(dismiss)
        viewController.present(alert, animated: true, completion: nil)
    }
}
