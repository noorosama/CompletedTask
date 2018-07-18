//
//  FormField.swift
//  Delegates
//
//  Created by SajaHammad on 7/16/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

enum FormField {
    
    case email
    case country
    case city
    case date
    
    var keyboardType: UIKeyboardType? {
        switch self {
        case .email: return .emailAddress
        case .country: return nil
        case .city: return nil
        case .date: return nil
        }
    }
    
    var placeholder: String {
        switch self {
        case .email: return "Please enter your email"
        case .country: return "Please pic your country"
        case .city: return "Please pic your city"
        case .date: return "Please pic your date of birth"
        }
    }
    
    var shouldBeginEditing: Bool {
        switch self {
        case .country: return false
        default: return true
        }
    }
}
