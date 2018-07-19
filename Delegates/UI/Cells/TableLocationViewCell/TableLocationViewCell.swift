//
//  TableLocationViewCell.swift
//  Delegates
//
//  Created by Nour Abukhaled on 5/29/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.


import UIKit
import Foundation

class TableLocationViewCell: UITableViewCell {
    
    //MARK: Variables
    private var shouldBeginEditing = true
    var textFieldComplitionHandlerr: ((UITextField) -> Void)?
    var doneComplitionHandler: ((UITextField) -> Void)?
    
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
    
    func displayTextFieldPlaceholder(placeholder: String) {
        textField.placeholder = placeholder
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        textField.keyboardType = keyboardType
    }
    
    func shouldBeginEditingEnabled(_ enabled: Bool) {
        shouldBeginEditing = enabled
    }
}

//MARK: - UITextFieldDelegate

extension TableLocationViewCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textFieldComplitionHandlerr?(textField)
        return shouldBeginEditing
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        doneComplitionHandler?(textField)
    }

    
}


