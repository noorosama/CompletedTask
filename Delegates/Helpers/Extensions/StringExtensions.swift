//
//  stringExtensions.swift
//  Delegates
//
//  Created by Nour Abukhaled on 7/2/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        
        return NSLocalizedString(self, comment: "")
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
}
