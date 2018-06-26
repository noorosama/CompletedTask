//
//  ListViewController.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/4/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK: Variables
    var itemsPassed: [LocationItem] = []
    var selectedItemComplitionHandlerrr: ((IndexPath) -> Void)?
    
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
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        itemsPassed.forEach({ $0.checked = false })

        let selecedCityCountry = itemsPassed[indexPath.row]

        selecedCityCountry.toggelChecked()

        tableView.reloadData()
        
       selectedItemComplitionHandlerrr?(indexPath)
        
        navigationController?.popViewController(animated: true)
        
    }
   

    func configureCheckmark(for cell:UITableViewCell, with item: LocationItem) {
        
        
        if item.checked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
    }
    
}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  itemsPassed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCountryCell", for: indexPath) as! TableCityCountryViewCell
        
        let item = itemsPassed[indexPath.row]
        
        cell.CityCountryLabel.text = item.text
        
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
}


