//
//  UploadReceiptView.swift
//  Paydantic
//
//  Created by Ma on 1/2/24.
//

import UIKit

class EnterTotalView: UIView {

    var textFieldTotal: UITextField!
    var buttonAdd: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTextFieldTotal()
        setupButtonAdd()
        
        initConstraints()
    }
    
    func setupTextFieldTotal(){
        textFieldTotal = UITextField()
        textFieldTotal.placeholder = "Enter Total After Tax & Tip"
        textFieldTotal.textAlignment = .center
        textFieldTotal.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldTotal)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Calculate Split", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldTotal.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldTotal.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAdd.topAnchor.constraint(equalTo: textFieldTotal.bottomAnchor, constant: 16),
            buttonAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
   
    
    //MARK: unused functions...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
