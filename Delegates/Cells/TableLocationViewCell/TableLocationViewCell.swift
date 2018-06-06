//
//  TableLocationViewCell.swift
//  Delegates
//
//  Created by Nour Abukhaled on 5/29/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.


import UIKit

class TableLocationViewCell: UITableViewCell, UITextFieldDelegate {
    
    var complitionHandlerr: (() -> Void)?
    
    
    @IBOutlet weak var textField: UITextField!
        {
        didSet {
            textField.delegate = self
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        complitionHandlerr?()
    }
  
}
