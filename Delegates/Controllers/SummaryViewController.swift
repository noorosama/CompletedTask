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
    var descriptionCountry: String = ""
    var descriptionCity: String = ""
    
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
        
    summaryTableView.dataSource = self
    summaryTableView.delegate = self
        
    let summaryXib = UINib(nibName: "SummaryTableViewCell", bundle: nil)
    summaryTableView.register(summaryXib, forCellReuseIdentifier: "SummaryCell")
        
    let summaryHeaderXib = UINib(nibName: "TableHeaderView", bundle: nil)
    summaryTableView.register(summaryHeaderXib, forHeaderFooterViewReuseIdentifier: "TableHeaderView")
        
    }
    
}
//MARK: - UITableViewDelegate
extension SummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let summaryHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeaderView") as! TableHeaderView
        
        summaryHeaderView.displayHeader(text: "Summary")
        
        return summaryHeaderView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

//MARK: - UITableViewDataSource
extension SummaryViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        summaryTableView.estimatedRowHeight = 80
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath) as! SummaryTableViewCell
        
        if indexPath.row == 0 {
           
            cell.displayLabel(text: "Country")
            cell.displayDescription(text: descriptionCountry)
        } else {
            cell.displayLabel(text: "City")
            cell.displayDescription(text: descriptionCity)
        }
        
        return cell
    }
    
    
    
}



