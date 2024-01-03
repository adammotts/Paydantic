//
//  ItemListView.swift
//  Paydantic
//
//  Created by Ma on 1/3/24.
//

import UIKit

class ItemListView: UIView {
    
    var tableViewItem: UITableView!
    
    var bottomButton: UIButton!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewItem()
        setupBottomButton()
        initConstraints()
    }
    
    func setupTableViewItem(){
        tableViewItem = UITableView()
        tableViewItem.register(ItemTableViewCell.self, forCellReuseIdentifier: "items")
        tableViewItem.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewItem)
    }
    
    func setupBottomButton() {
        bottomButton = UIButton(type: .system)
        bottomButton.setTitle("Done Adding Items", for: .normal)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button to the view
        self.addSubview(bottomButton)
    }
    
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewItem.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewItem.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewItem.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewItem.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
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
