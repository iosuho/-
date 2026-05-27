//
//  Untitled.swift
//  Куда гоним, шо
//
//  Created by Владимир Пройдаков on 27.05.2026.
//

import UIKit

//MARK: - Расширение для Alert
extension UIViewController {
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
