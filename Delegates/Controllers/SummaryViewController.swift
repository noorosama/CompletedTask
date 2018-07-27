//
//  SummaryViewController.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/25/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var summaryTableView: UITableView!
    
    //MARK: Variables
    var descriptionCountry: String?
    var descriptionCity: String?
    var summaryRecevedItems: [SummaryItem] = []
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        summaryTableView.tableFooterView = UIView()
        configurSummaryTableView()
    }
    
}
 //MARK: - Configurations
 extension SummaryViewController {
    
    func configurSummaryTableView() {
        
    let summaryXib = UINib(nibName: Constants.NibName.summaryCell, bundle: nil)
    summaryTableView.register(summaryXib, forCellReuseIdentifier: Constants.Identifier.summaryCell)
        
    let summaryHeaderXib = UINib(nibName: Constants.NibName.header, bundle: nil)
    summaryTableView.register(summaryHeaderXib, forHeaderFooterViewReuseIdentifier: Constants.Identifier.header)
        
    }
}

//MARK: - UITableViewDelegate
extension SummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let summaryHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.header) as! TableHeaderView
        
        summaryHeaderView.displayHeader(text: LocalizationKeys.Headers.summary.localized)
        
        return summaryHeaderView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

//MARK: - UITableViewDataSource

extension SummaryViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return summaryRecevedItems.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        summaryTableView.estimatedRowHeight = 80
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.summaryCell, for: indexPath) as! SummaryTableViewCell
        
        let item = summaryRecevedItems[indexPath.row]
           
            cell.displayLabel(text: item.description)
            cell.displayDescription(text: item.value)
        
        return cell
    }
    
    
    
}



