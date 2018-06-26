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
    
    var selectedItem: LocationItem?

    var selectedIndexPath: IndexPath?
    
    var locationData = LocationData()
    
    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    //MARK: Initializer
    required init?(coder aDecoder: NSCoder) {
        
        countryItems = [LocationItem]()
        cityItems = [LocationItem]()
        
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
        
        let storyboard = UIStoryboard(name: "ListViewController", bundle: nil)
        let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
       
        cell.textFieldComplitionHandlerr = { textField in
            
            let point = textField.convert(textField.bounds.origin, to: tableView)
            let textFieldIndexPath = tableView.indexPathForRow(at: point)
            self.selectedIndexPath = textFieldIndexPath
            
            if indexPath.row == 0 {
                self.locationItems = self.countryItems
            }else {
                self.locationItems = self.cityItems
            }
            listViewController.itemsPassed = self.locationItems
            
            self.view.endEditing(true)
            
            self.navigationController?.pushViewController(listViewController, animated: true)
        }
        
        listViewController.selectedItemComplitionHandlerrr = { indexPath in
            
            self.selectedItem = self.locationItems[indexPath.row]
            
            if self.selectedIndexPath?.row == 0 {
                self.locationData.countryItem = (self.selectedItem?.text)!
            } else {
                self.locationData.cityItem = (self.selectedItem?.text)!
            }
          
            tableView.reloadData()
        }
        
        if let selectedIndexx = selectedIndexPath {
            if selectedIndexx.row == indexPath.row {
                cell.displayTextField(text: selectedItem?.text ?? "")
            }
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
    
       let storyboard = UIStoryboard(name: "SummaryViewController", bundle: nil)
       let summaryViewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
    
    
       let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableFooterView") as! TableFooterView
        
        footerView.displayButtonName(text: "Submit")
       
        footerView.submitComplitionHandler = {
            
        if self.locationData.countryItem.isEmpty || self.locationData.cityItem.isEmpty {
               
        self.showAlert(message: "All Fields Required", handler: nil)
                    
        } else {
            
        self.showAlert(message: "The location has been submitted successfully", handler: {
            
            summaryViewController.descriptionCountry = self.locationData.countryItem
            summaryViewController.descriptionCity = self.locationData.cityItem
            
         self.navigationController?.pushViewController(summaryViewController, animated: true)
            
            })
            
        }
    }
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
}
    //MARK: - Helper Methods
    
    extension ViewController {
    
    func showAlert(message: String, handler:  (() -> Void)? ) {
       
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            handler?()
        })
        
        alert.addAction(action)
       
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
    

