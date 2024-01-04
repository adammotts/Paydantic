//
//  AddPersonViewController.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class AddPersonViewController: UIViewController {

    var delegate: ViewController!
    
    var index: Int!
    
    //MARK: initializing the ADDExpenseView...
    let addPersonScreen = AddPersonView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addPersonScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Person"

        addPersonScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: action for tapping buttonAdd..
    @objc func onAddButtonTapped(){
        var name: String = ""
        if let nameText = addPersonScreen.textFieldName.text {
            if !nameText.isEmpty {
                name = nameText
            }
            else {
                return
            }
        }
        
        var venmo: String = ""
        if let venmoText = addPersonScreen.textFieldVenmo.text {
            if !venmoText.isEmpty {
                venmo = venmoText
            }
            else {
                return
            }
        }
        
        let newPerson = Person(name: name, venmo: venmo)
        delegate.delegateOnAddPerson(person: newPerson, index: self.index)
        navigationController?.popViewController(animated: true)
    }
}
