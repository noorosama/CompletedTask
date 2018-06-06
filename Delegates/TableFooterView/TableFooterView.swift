//
//  TableFooterView.swift
//  Delegates
//
//  Created by Nour Abukhaled on 5/30/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import  UIKit

class TableFooterView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var submitButton: UIButton!
    
    var complitionHandler: (()-> Void)?
    
    @IBAction func submitButtonTouch(_ sender: Any) {
        
        print("nooor")
        
        complitionHandler?()
        
       
        
    }
    
    
}

//MARK: - Helper Method
extension TableFooterView {
    
    func displayButtonName(text: String) {
        
       submitButton.setTitle(text,for: .normal)
        
    }
}






