//
//  ListViewController.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/4/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
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

//MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  itemsPassed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.listCell, for: indexPath) as! TableCityCountryViewCell
        
        let item = itemsPassed[indexPath.row]
        
        cell.CityCountryLabel.text = item.text
        
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    itemsPassed.forEach({ $0.isChecked = false })
    
    let selecedCityCountry = itemsPassed[indexPath.row]
    
    selecedCityCountry.toggelChecked()
    
    tableView.reloadData()
    
    selectedItemComplitionHandlerrr?(indexPath)
    
    navigationController?.popViewController(animated: true)
    
   }
}

//MARK: - Configurations

extension ListViewController {
    
    func configurListTableView() {
        
        let cityCountryXib = UINib(nibName: Constants.NibName.listCell, bundle: nil)
        listTableView.register(cityCountryXib, forCellReuseIdentifier: Constants.Identifier.listCell)
    }
   
    func configureCheckmark(for cell:UITableViewCell, with item: LocationItem) {
        
        
        if item.isChecked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
    }
    
}


