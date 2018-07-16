//
//  SummaryTableViewCell.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/25/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {

    //MARK: Outlets
    
    @IBOutlet weak var headerCellLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

//MARK: - Helper Methods

extension SummaryTableViewCell {
        
        func displayLabel(text: String) {
            
            headerCellLabel.text = text
            
        }
            
       func displayDescription(text: String) {
        
            descriptionLabel.text = text
        
        }
    
}
