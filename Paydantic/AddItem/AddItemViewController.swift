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
    
    //MARK: initializing the ADDExpenseView...
    let addItemScreen = AddItemView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addItemScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Item"

        addItemScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: action for tapping buttonAdd..
    @objc func onAddButtonTapped(){
        var name: String?
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
        
        let newItem = Item(name: name, cost: cost)
        delegate.delegateOnAddItem(Item: newItem, index: self.index)
        navigationController?.popViewController(animated: true)
    }
}
