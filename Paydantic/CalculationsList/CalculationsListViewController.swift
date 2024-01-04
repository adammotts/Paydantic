//
//  CalculationsListViewController.swift
//  Paydantic
//
//  Created by Ma on 1/4/24.
//

import UIKit

class CalculationsListViewController: UIViewController {
    
    let personList = CalculationsListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of People"
        
        personList.tableViewPerson.delegate = self
        personList.tableViewPerson.dataSource = self
    }
    
    override func loadView() {
        view = personList
    }
}

extension CalculationsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bill.people.count
    }
    
    //MARK: controlling the view of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calculations", for: indexPath) as! CalculationsTableViewCell
        
        cell.labelName.text = Bill.people[indexPath.row].name
        cell.labelVenmo.text = "Venmo: @\(Bill.people[indexPath.row].venmo)"
        
        var amountOwed = String(format: "%.2f", Bill.people[indexPath.row].total)
        
        cell.labelTotal.text = "Amount Owed: $\(amountOwed)"
        
        return cell
    }
}
