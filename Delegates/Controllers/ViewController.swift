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
    
    var locationData = LocationData()
    
    //MARK: Constants
    
    let fields: [FormField] = [
       .email,
       .country,
       .city,
       .date
    ]
    
    let picker = UIPickerView()

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
        
        picker.delegate = self
        picker.dataSource = self
      
        configureTableView()
        
    }
}


//MARK: - Configurations
private extension ViewController {
    
    func configureTableView() {
        
        let locationXib = UINib(nibName: Constants.NibName.mainCell, bundle: nil)
        tableView.register(locationXib, forCellReuseIdentifier: Constants.Identifier.mainCell)
        
        let locationHeaderXib = UINib(nibName: Constants.NibName.header, bundle: nil)
        tableView.register(locationHeaderXib, forHeaderFooterViewReuseIdentifier: Constants.Identifier.header)
        
        let locationFooterXib = UINib(nibName: Constants.NibName.footer, bundle: nil)
        tableView.register(locationFooterXib, forHeaderFooterViewReuseIdentifier: Constants.Identifier.footer)
    }
}

//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return cityItems.count
    }
}
    //MARK: - UIPickerViewDelegate
    extension ViewController: UIPickerViewDelegate {
        
        func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            return cityItems[row].text
        }
        
        func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            let indexPath = IndexPath(row: picker.tag, section: 0)
            
            let cell = tableView.cellForRow(at: indexPath) as? TableLocationViewCell
            
            cell?.displayTextField(text: cityItems[row].text)
        }
    }

//MARK: - Actions
private extension ViewController {
    
    func navigateToListVC() {
        
        let storyboard = UIStoryboard(name: Constants.StoryboardName.list, bundle: nil)
        
        let listViewController = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardID.list) as! ListViewController
        
        self.locationItems = self.countryItems
        
        listViewController.itemsPassed = self.locationItems
        
        listViewController.selectedItemComplitionHandlerrr = { indexPath in
            self.didSelectItem(at: indexPath)
        }
        
        self.navigationController?.pushViewController(listViewController, animated: true)
        
    }
    
    func itemTextFieldTapped(_ textField: UITextField, at indexPath: IndexPath) {
        
        let field = fields[indexPath.row]
        
        if field == .country {
            navigateToListVC()
        }
        
        if field == .city {
            
           textField.inputView = picker
           picker.tag = textField.tag
            
        }
        
        if field == .date {
            
            let datePickerView : UIDatePicker = UIDatePicker()
            let dateFormatter = DateFormatter()
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            textField.inputView = datePickerView
            datePickerView.tag = textField.tag
            textField.text = dateFormatter.string(from: datePickerView.date)
            
            datePickerView.addTarget(self, action: #selector(datePickerValueChanged(caller:)), for: UIControlEvents.valueChanged)
        }
        
        
    }
    
    @objc func datePickerValueChanged(caller: UIDatePicker){
        
        let indexPath = IndexPath(row: caller.tag, section: 0)

        let cell = tableView.cellForRow(at: indexPath) as? TableLocationViewCell
     
        cell?.textField.text = caller.date.toString(.dateOfBirth)
        
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
       self.selectedItem = self.locationItems[indexPath.row]

       self.locationData.countryItem = (self.selectedItem?.text)!
        
       tableView.reloadRows(at: [indexPath], with: .none)

    }
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.mainCell, for: indexPath) as! TableLocationViewCell
        
        let field = fields[indexPath.row]
        
        cell.textFieldComplitionHandlerr = { textField in
            
            self.itemTextFieldTapped(textField, at: indexPath)
        }
        cell.textField.tag = indexPath.row
        cell.displayTextField(text: selectedItem?.text ?? "")
        cell.displayTextFieldPlaceholder(placeholder: field.placeholder)
        if let keyboardType = field.keyboardType {
            cell.setKeyboardType(keyboardType: keyboardType)
        }
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.header) as! TableHeaderView
        
        headerView.displayHeader(text: LocalizationKeys.Headers.main.localized)
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let storyboard = UIStoryboard(name: Constants.StoryboardName.summary, bundle: nil)
        let summaryViewController = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardID.summary) as! SummaryViewController
        
        
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.footer) as! TableFooterView

        footerView.displayButtonName(text: LocalizationKeys.ButtonNames.submitButton.localized)
        
        footerView.submitComplitionHandler = {
            
            if self.locationData.countryItem.isEmpty || self.locationData.cityItem.isEmpty {
                
                self.showAlert(message: LocalizationKeys.Messages.emptyFieldMessage.localized, handler: nil)
                
            } else {
                
                self.showAlert(message: LocalizationKeys.Messages.successMessage.localized, handler: {
                    
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

