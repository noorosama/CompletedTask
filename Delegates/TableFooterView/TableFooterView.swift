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
    
    //MARK: Variables
    
    var submitComplitionHandler: (() -> Void)?
    
    //MARK: Outlets
    
    @IBOutlet  weak var submitButton: UIButton!
    
    @IBAction func submitDidTap(_ sender: Any) {
        
        submitComplitionHandler!()
    }
    
   
}

//MARK: - Helper Methods
extension TableFooterView {
    
    func displayButtonName(text: String) {
        
       submitButton.setTitle(text,for: .normal)
        
        
    }
}






