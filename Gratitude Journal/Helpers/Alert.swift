//
//  Alert.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/29/22.
//

import UIKit

protocol Alert {
}

extension Alert where Self: UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
