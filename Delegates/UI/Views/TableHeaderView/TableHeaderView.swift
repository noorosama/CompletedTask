//
//  TableHeaderView.swift
//  Delegates
//
//  Created by Nour Abukhaled on 5/29/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

class TableHeaderView: UITableViewHeaderFooterView {
    
   //MARK: Outlets

    @IBOutlet private weak var headerLabel: UILabel!
    
    
}

//MARK: - Helper Methods
extension TableHeaderView {
    
    func displayHeader(text: String) {
        
        headerLabel.text = text
    }
}



