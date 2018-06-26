//
//  TableLocationViewCell.swift
//  Delegates
//
//  Created by Nour Abukhaled on 5/29/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.


import UIKit
import Foundation

class TableLocationViewCell: UITableViewCell, UITextFieldDelegate {
    
    //MARK: Variables
    
    var textFieldComplitionHandlerr: ((UITextField) -> Void)?
    
    //MARK: Outlets
    
    @IBOutlet weak var textField: UITextField!
        {
        didSet {
        
            textField.delegate = self
            
        }
    }
  
}

//MARK: - Helper Methods

extension TableLocationViewCell {
    
    func displayTextField(text: String) {
       textField.text = text
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        textFieldComplitionHandlerr?(textField)
        return false
    }
}


