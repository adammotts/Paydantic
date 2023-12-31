//
//  PersonListView.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class PersonListView: UIView {
    
    var tableViewPerson: UITableView!
    
    var bottomButton: UIButton!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewPerson()
        setupBottomButton()
        initConstraints()
    }
    
    func setupTableViewPerson(){
        tableViewPerson = UITableView()
        tableViewPerson.register(PersonTableViewCell.self, forCellReuseIdentifier: "people")
        tableViewPerson.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPerson)
    }
    
    func setupBottomButton() {
        bottomButton = UIButton(type: .system)
        bottomButton.setTitle("Done Adding People", for: .normal)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button to the view
        self.addSubview(bottomButton)
    }
    
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewPerson.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewPerson.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewPerson.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewPerson.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            bottomButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomButton.heightAnchor.constraint(equalToConstant: 100) // Adjust the height as needed
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
