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
    
    var buttonAdd: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldCost()
        setupButtonAdd()
        
        initConstraints()
    }
    
    //MARK: methods to initialize the UI elements...
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Enter Name"
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldCost(){
        textFieldCost = UITextField()
        textFieldCost.placeholder = "Enter Cost"
        textFieldCost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCost)
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
            
            buttonAdd.topAnchor.constraint(equalTo: textFieldCost.bottomAnchor, constant: 16),
            buttonAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}