//
//  LocationItem.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/5/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

class LocationItem  {
    
    //MARK: Variables
    var text = ""
    var checked = false
}

//MARK: - Helper Methods
extension LocationItem  {
    func toggelChecked() {
        
        checked = !checked
    }
}
