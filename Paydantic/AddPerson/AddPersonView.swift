//
//  AddPersonView.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class AddPersonView: UIView {

    var textFieldName: UITextField!
    var textFieldVenmo: UITextField!
    
    var buttonAdd: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTextFieldName()
        setupTextFieldVenmo()
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
    
    func setupTextFieldVenmo(){
        textFieldVenmo = UITextField()
        textFieldVenmo.placeholder = "Enter Venmo"
        textFieldVenmo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldVenmo)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Save Person", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    //MARK: initialize the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldVenmo.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldVenmo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAdd.topAnchor.constraint(equalTo: textFieldVenmo.bottomAnchor, constant: 16),
            buttonAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
