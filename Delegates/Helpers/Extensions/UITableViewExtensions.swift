//
//  UITableViewExtensions.swift
//  Delegates
//
//  Created by Nour Abukhaled on 7/23/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import  UIKit

extension UITableView {
    
    func createFooterView() {
        
        let footerView = dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.footer) as! TableFooterView
        
        let contentView = UIView(frame:
            CGRect(x: 0, y: 0, width: bounds.width, height: 80)
        )
        
        contentView.addSubview(footerView)
        
        footerView.frame = contentView.bounds
        
        tableFooterView = contentView
        
     }
    
  }

