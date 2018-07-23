//
//  DateExtensions.swift
//  Delegates
//
//  Created by Anas Alhasani on 7/17/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(_ format: Constants.DateFormat) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
        
    }

}

