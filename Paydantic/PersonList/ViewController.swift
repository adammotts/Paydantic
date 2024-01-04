//
//  ViewController.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    let personList = PersonListView()
    
    var peopleControllers = [AddPersonViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of People"
        
        personList.tableViewPerson.delegate = self
        personList.tableViewPerson.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        personList.bottomButton.addTarget(self, action: #selector(onBottomButtonTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        view = personList
    }
    
    @objc func onBottomButtonTapped() {
        let uploadReceiptController = UploadReceiptViewController()
        navigationController?.pushViewController(uploadReceiptController, animated: true)
    }
    
    @objc func onAddBarButtonTapped(){
        let addPersonController = AddPersonViewController()
        addPersonController.delegate = self
        addPersonController.index = peopleControllers.count
        self.peopleControllers.append(addPersonController)
        Bill.people.append(Person())
        navigationController?.pushViewController(addPersonController, animated: true)
    }
    
    //MARK: got the new person back and delegated to ViewController...
    func delegateOnAddPerson(person: Person, index: Int) {
        Bill.people[index] = person
        personList.tableViewPerson.reloadData()
    }
    
    //MARK: remove a selected person
    func delegateOnRemovePerson(index: Int) {
        Bill.people.remove(at: index)
        self.peopleControllers.remove(at: index)
        personList.tableViewPerson.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bill.people.count
    }
    
    //MARK: controlling the view of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "people", for: indexPath) as! PersonTableViewCell
        
        cell.labelName.text = Bill.people[indexPath.row].name
        cell.labelVenmo.text = "Venmo: @\(Bill.people[indexPath.row].venmo)"
        
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addPersonController = self.peopleControllers[indexPath.row]
        
        navigationController?.pushViewController(addPersonController, animated: true)
    }
    
    //MARK: swipe left to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegateOnRemovePerson(index: indexPath.row)
        }
    }
}
