//
//  AddItemViewController.swift
//  Paydantic
//
//  Created by Ma on 1/3/24.
//

import UIKit

class AddItemViewController: UIViewController {

    var delegate: ItemListViewController!
    
    var index: Int!
    
    var selectedPeople = Set<Person>()
    
    //MARK: initializing the ADDExpenseView...
    let addItemScreen = AddItemView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addItemScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Item"
        
        // Initially set up the menu
        updateMenu()

        addItemScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }

    func updateMenu() {
        addItemScreen.buttonSelectPeople.menu = getMenuPeople()
    }

    func getMenuPeople() -> UIMenu {
        var menuItems: [UIMenuElement] = []

        for person in Bill.people {
            let isSelected = selectedPeople.contains(person)

            let state: UIMenuElement.State = isSelected ? .on : .off
            let action = UIAction(title: person.name, state: state) { [weak self] _ in
                // Toggle selection
                if isSelected {
                    self?.selectedPeople.remove(person)
                } else {
                    self?.selectedPeople.insert(person)
                }
                
                // Update UI and refresh the menu
                self?.updateUIForSelectedPeople()
                self?.updateMenu()
            }

            menuItems.append(action)
        }

        return UIMenu(title: "Select People", children: menuItems)
    }

    func updateUIForSelectedPeople() {
        var selectedNames = selectedPeople.map { $0.name }.joined(separator: ", ")
        
        if selectedNames == "" {
            selectedNames = "Select People"
        }
        
        addItemScreen.buttonSelectPeople.setTitle(selectedNames, for: .normal)
    }
    
    //MARK: action for tapping buttonAdd..
    @objc func onAddButtonTapped(){
        var name: String = ""
        if let nameText = addItemScreen.textFieldName.text {
            if !nameText.isEmpty {
                name = nameText
            }
            else {
                return
            }
        }
        
        var cost: Double = 0.0
        if let costText = addItemScreen.textFieldCost.text {
            if !costText.isEmpty {
                var defaultValue = 0.0
                cost = Double(costText) ?? defaultValue
            }
            else {
                return
            }
        }
        
        let newItem = Item(name: name, cost: cost, consumers: Array(selectedPeople))
        delegate.delegateOnAddItem(Item: newItem, index: self.index)
        navigationController?.popViewController(animated: true)
    }
}
