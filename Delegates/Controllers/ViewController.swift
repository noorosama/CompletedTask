//
//  ViewController.swift
//  Delegates
//
//  Created by Nour Abukhaled on 5/28/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    var countryItems: [LocationItem] = []
    var cityItems: [LocationItem] = []
    var locationItems: [LocationItem] = []
    var selecedLocation : LocationItem? = nil
    
    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Initializer
    required init?(coder aDecoder: NSCoder) {
        // NSCoder to save data to disc and read it back again
        
        countryItems = [LocationItem]()
        cityItems = [LocationItem]()
        // Create obj to use proprities
        
        let country0Item = LocationItem()
        country0Item.text = "country0"
        countryItems.append(country0Item)
        
        let country1Item = LocationItem()
        country1Item.text = "country1"
        countryItems.append(country1Item)
        
        let country2Item = LocationItem()
        country2Item.text = "country2"
        countryItems.append(country2Item)
        
        let country3Item = LocationItem()
        country3Item.text = "country3"
        countryItems.append(country3Item)
        
        let country4Item = LocationItem()
        country4Item.text = "country4"
        countryItems.append(country4Item)
        
        let country5Item = LocationItem()
        country5Item.text = "country5"
        countryItems.append(country5Item)
        
        let country6Item = LocationItem()
        country6Item.text = "country6"
        countryItems.append(country6Item)
        
        let country7Item = LocationItem()
        country7Item.text = "country7"
        countryItems.append(country7Item)
 //---------------------------------------------
        let city0Item = LocationItem()
        city0Item.text = "city0"
        cityItems.append(city0Item)
        
        let city1Item = LocationItem()
        city1Item.text = "city1"
        cityItems.append(city1Item)
        
        let city2Item = LocationItem()
        city2Item.text = "city2"
        cityItems.append(city2Item)
        
        let city3Item = LocationItem()
        city3Item.text = "city3"
        cityItems.append(city3Item)
        
        let city4Item = LocationItem()
        city4Item.text = "city4"
        cityItems.append(city4Item)
        
        let city5Item = LocationItem()
        city5Item.text = "city5"
        cityItems.append(city5Item)
        
        let city6Item = LocationItem()
        city6Item.text = "city6"
        cityItems.append(city6Item)
        
        let city7Item = LocationItem()
        city7Item.text = "city7"
        cityItems.append(city7Item)
        
        super.init(coder: aDecoder)
    }
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}


//MARK: - Configurations
private extension ViewController {
    
    func configureTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let locationXib = UINib(nibName: "TableLocationViewCell", bundle: nil)
        tableView.register(locationXib, forCellReuseIdentifier: "LocationCell")
        
        let locationHeaderXib = UINib(nibName: "TableHeaderView", bundle: nil)
        tableView.register(locationHeaderXib, forHeaderFooterViewReuseIdentifier: "TableHeaderView")
        
        let locationFooterXib = UINib(nibName: "TableFooterView", bundle: nil)
        tableView.register(locationFooterXib, forHeaderFooterViewReuseIdentifier: "TableFooterView")
        
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! TableLocationViewCell
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        
        cell.complitionHandlerr = {
            
            print("noor2")
            
            let storyboard = UIStoryboard(name: "listViewController", bundle: nil)
            
            let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            
            if indexPath.row == 0 {
                
                self.locationItems = self.countryItems
                
            }else {
                
                self.locationItems = self.cityItems
               
            }
            
    
            listViewController.itemsPassed = self.locationItems
            
            self.view.endEditing(true)
            self.navigationController?.pushViewController(listViewController, animated: true)
            
            print("noor2")
            
           
        }
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeaderView") as! TableHeaderView
        
        headerView.displayHeader(text: "Location")
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableFooterView") as! TableFooterView
        
        footerView.displayButtonName(text: "Submit")
        
        footerView.complitionHandler = {
            print("noooor")
            let storyboard = UIStoryboard(name: "listViewController", bundle: nil)
            let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            listViewController.itemsPassed = self.countryItems
            
            self.navigationController?.pushViewController(listViewController, animated: true)
        }
        
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
}
