//
//  ViewController.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    let personList = PersonListView()
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Paydantic"
        
        personList.tableViewPerson.delegate = self
        personList.tableViewPerson.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }
    
    override func loadView() {
        view = personList
    }
    
    @objc func onAddBarButtonTapped(){
        let addPersonController = AddPersonViewController()
        addPersonController.delegate = self
        navigationController?.pushViewController(addPersonController, animated: true)
    }
    
    //MARK: got the new person back and delegated to ViewController...
    func delegateOnAddPerson(person: Person){
        people.append(person)
        personList.tableViewPerson.reloadData()
    }
    
    //MARK: remove a selected person
    func delegateOnRemovePerson(index: Int) {
        people.remove(at: index)
        personList.tableViewPerson.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "people", for: indexPath) as! PersonTableViewCell
        
        cell.labelName.text = people[indexPath.row].name
        var defaultValue = "N/A"
        cell.labelVenmo.text = "Venmo: \(people[indexPath.row].venmo ?? defaultValue)"
        
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addPersonController = AddPersonViewController()
        addPersonController.delegate = self
        
        addPersonController.addPersonScreen.textFieldName.text = people[indexPath.row].name
        addPersonController.addPersonScreen.textFieldVenmo.text = people[indexPath.row].venmo
        
        navigationController?.pushViewController(addPersonController, animated: true)
    }
}
