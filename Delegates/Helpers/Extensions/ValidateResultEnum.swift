//
//  Enums.swift
//  Delegates
//
//  Created by Admin user on 7/24/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

enum validateResult {
    
    case valid(String)
    case inValid(String)
}

    func validate(registrationData: RegistrationData) -> validateResult  {

        if registrationData.countryItem.isEmpty || registrationData.date.isEmpty || registrationData.cityItem.isEmpty {

            return .inValid(LocalizationKeys.Messages.emptyFieldMessage.localized)

        } else {

            return .valid(LocalizationKeys.Messages.successMessage.localized)

        }

    }

