//
//  LocationItem.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/5/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

class LocationItem {
    
    //MARK: Variables
    var text = ""
    var isChecked = false
}

//MARK: - Helper Methods
extension LocationItem {
    
    func toggelChecked() {
        isChecked = !isChecked
    }
}
