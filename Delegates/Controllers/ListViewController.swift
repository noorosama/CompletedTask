//
//  ListViewController.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/4/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UITableViewDelegate{
    
    //MARK: Outlets
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK: Variables
    var itemsPassed: [LocationItem] = []
    var selecedCityCountry : LocationItem? = nil
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurListTableView()
    }
}
//MARK: - Configurations
extension ListViewController {
    
    func configurListTableView() {
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        let cityCountryXib = UINib(nibName: "TableCityCountryViewCell", bundle: nil)
        listTableView.register(cityCountryXib, forCellReuseIdentifier: "CityCountryCell")
    }
    
}
////MARK: - UITableViewDelegate
//extension ListViewController: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        selecedCityCountry = itemsPassed[indexPath.row]
//        
//        self.performSegue(withIdentifier: "DetailesSegue", sender: nil)
//        
//        view.endEditing(true)
//        
//    }
//}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  itemsPassed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCountryCell", for: indexPath) as! TableCityCountryViewCell
        
        let item = itemsPassed[indexPath.row]
        
        cell.CityCountryLabel.text = item.text
        
        return cell
    }
    
}


