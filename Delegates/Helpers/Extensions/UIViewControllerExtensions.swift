//
//  UIViewControllerExtensions.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/27/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

enum validateResult {
    
    case valid(String)
    case emptyDate(String)
    case emptyCountry(String)
    case emptyCity(String)
    case emptyEmail(String)
}

extension UIViewController {
    
    func showAlert(message: String, handler:  (() -> Void)? ) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: LocalizationKeys.ButtonNames.okButton.localized, style: .default, handler: { _ in
            handler?()
        })
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func validate(registrationData: RegistrationData) -> validateResult  {
        
        if registrationData.date.isEmpty {
            
            return .emptyDate(LocalizationKeys.Messages.emptyDateFieldMessage.localized)
            
        } else if registrationData.countryItem.isEmpty {
            
            return .emptyCountry(LocalizationKeys.Messages.emptyCountryFieldMessage.localized)
            
        } else if registrationData.cityItem.isEmpty {
            
            return .emptyCity(LocalizationKeys.Messages.emptyCityFieldMessage.localized)
            
        } else if registrationData.email.isEmpty {
            
            return .emptyEmail(LocalizationKeys.Messages.emptyEmailFieldMessage.localized)
            
        } else {
            
            return .valid(LocalizationKeys.Messages.successMessage.localized)
        }
        
    }
    
    
}
    
//    func navigate<T: UIViewController>(_ viewController: T.Type, of storyboard: Constants.StoryboardID) {
//
//        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
//
//        let controllerIdentifier = String(describing: self)
//
//        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? T else {
//            fatalError("Could not instantiate ViewController: \(controllerIdentifier)")
//        }
//
//        navigationController?.pushViewController(controller, animated: true)
//
//    }
//}
//
//extension UITableView {
//
//    func register<Cell: UITableViewCell>(_ cell: Cell.Type) {
//
//        let identifier = String(describing: Cell.self)
//
//        let nib = UINib(nibName: identifier, bundle: nil)
//
//        register(nib, forCellReuseIdentifier: identifier)
//    }
//}

