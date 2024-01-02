//
//  PersonListView.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class PersonListView: UIView {
    
    var tableViewPerson: UITableView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewPerson()
        initConstraints()
    }
    
    func setupTableViewPerson(){
        tableViewPerson = UITableView()
        tableViewPerson.register(PersonTableViewCell.self, forCellReuseIdentifier: "people")
        tableViewPerson.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewPerson)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewPerson.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewPerson.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewPerson.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewPerson.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
