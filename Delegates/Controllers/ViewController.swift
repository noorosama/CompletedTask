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
    var textValue: String?
    
    var locationData = LocationData()
    
    //MARK: Constants
    
    let fields: [FormField] = [
       .email,
       .country,
       .city,
       .date
    ]
    
    let cityPickerView = UIPickerView()
    let datePickerView : UIDatePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    var countryIndexPath: IndexPath!

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
        configureCityPickerView()
        
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
    
    func configureCityPickerView() {
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
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
            
            let indexPath = IndexPath(row: cityPickerView.tag, section: 0)
            
            let cell = tableView.cellForRow(at: indexPath) as? TableLocationViewCell
            
            cell?.displayTextField(text: cityItems[row].text)
        }
  }

//MARK: - Actions

private extension ViewController {
    
    func navigateToListViewController() {
        
        let storyboard = UIStoryboard(name: Constants.StoryboardName.list, bundle: nil)
        
        let listViewController = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardID.list) as! ListViewController
        
        self.locationItems = self.countryItems
        
        listViewController.itemsPassed = self.locationItems
        
        self.navigationController?.pushViewController(listViewController, animated: true)
        
        listViewController.selectedItemComplitionHandlerrr = { indexPath in
            self.didSelectItem(at: indexPath)
        }

    }
    
    func navigateToSummaryViewController() {
        
        let storyboard = UIStoryboard(name: Constants.StoryboardName.summary, bundle: nil)
        
        let summaryViewController = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardID.summary) as! SummaryViewController
        
        summaryViewController.descriptionCountry = self.locationData.countryItem
        
        self.navigationController?.pushViewController(summaryViewController, animated: true)
        
    }
    
    func itemTextFieldTapped(_ textField: UITextField, at indexPath: IndexPath) {
        
        let field = fields[indexPath.row]
        
        if field == .country {
            
            navigateToListViewController()
        }
        
        if field == .city {
            
           textField.inputView = cityPickerView
            
           cityPickerView.tag = textField.tag
            
        }
        
        if field == .date {
            
            datePickerView.datePickerMode = UIDatePickerMode.date
            
            textField.inputView = datePickerView
            
            datePickerView.tag = textField.tag

        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField,_ field: FormField){
        
        if field == .date {
            
        textField.text = datePickerView.date.toString(.dateOfBirth)
            
        } else {
        
        textField.text = cityItems[cityPickerView.selectedRow(inComponent: 0)].text
    }
}
    
    func didSelectItem(at indexPath: IndexPath) {
        
        self.selectedItem = self.locationItems[indexPath.row]
        
        self.locationData.countryItem = (selectedItem?.text)!

        let cell = tableView.cellForRow(at: countryIndexPath) as? TableLocationViewCell
        
        cell?.textField.text = locationData.countryItem

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
        
        if field == .country {
            
            countryIndexPath = indexPath
        }
        
        if field == .date || field == .city {
            
            cell.doneComplitionHandler = { textField in
                
                self.textFieldDidEndEditing(textField, field)
            }
        }
        
        cell.textFieldComplitionHandlerr = { textField in
            
            self.itemTextFieldTapped(textField, at: indexPath)
        }
        
        cell.shouldBeginEditingEnabled(field.shouldBeginEditing)
        
        cell.textField.tag = indexPath.row
        
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
        
        
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.footer) as! TableFooterView

            footerView.displayButtonName(text: LocalizationKeys.ButtonNames.submitButton.localized)
        
           footerView.submitComplitionHandler = {
            
            if self.locationData.countryItem.isEmpty  {

                self.showAlert(message: LocalizationKeys.Messages.emptyFieldMessage.localized, handler: nil)

            } else {
            
                self.showAlert(message: LocalizationKeys.Messages.successMessage.localized, handler: {

                    self.navigateToSummaryViewController()

                })
            
            }
         }
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
}

