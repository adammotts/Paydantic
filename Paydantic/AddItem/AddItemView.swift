//
//  AddItemView.swift
//  Paydantic
//
//  Created by Ma on 1/3/24.
//

import UIKit

class AddItemView: UIView {

    var textFieldName: UITextField!
    var textFieldCost: UITextField!
    var buttonSelectPeople: UIButton!
    
    var buttonAdd: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldCost()
        setupButtonSelectPeople()
        setupButtonAdd()
        
        initConstraints()
    }
    
    //MARK: methods to initialize the UI elements...
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Enter Name"
        textFieldName.textAlignment = .center
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldCost(){
        textFieldCost = UITextField()
        textFieldCost.placeholder = "Enter Cost"
        textFieldCost.textAlignment = .center
        textFieldCost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCost)
    }
    
    func setupButtonSelectPeople(){
        buttonSelectPeople = UIButton(type: .system)
        buttonSelectPeople.setTitle("Select People", for: .normal)
        buttonSelectPeople.showsMenuAsPrimaryAction = true
        buttonSelectPeople.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectPeople)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Save Item", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    //MARK: initialize the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldCost.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldCost.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSelectPeople.topAnchor.constraint(equalTo: textFieldCost.bottomAnchor, constant: 16),
            buttonSelectPeople.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAdd.topAnchor.constraint(equalTo: buttonSelectPeople.bottomAnchor, constant: 16),
            buttonAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
