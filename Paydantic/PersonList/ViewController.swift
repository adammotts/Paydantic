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
    
    var bottomButton: UIButton!
    
    var bill = Bill()
    
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
        
        setupBottomButton()
        
        initConstraints()
    }
    
    override func loadView() {
        view = personList
    }
    
    func setupBottomButton() {
        bottomButton = UIButton(type: .system)
        bottomButton.setTitle("Next", for: .normal)
        bottomButton.addTarget(self, action: #selector(onBottomButtonTapped), for: .touchUpInside)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the button to the view
        view.addSubview(bottomButton)
    }
    
    @objc func onBottomButtonTapped() {
        print("Bottom Button Clicked")
    }
    
    @objc func onAddBarButtonTapped(){
        let addPersonController = AddPersonViewController()
        addPersonController.delegate = self
        addPersonController.index = peopleControllers.count
        self.peopleControllers.append(addPersonController)
        self.bill.people.append(Person())
        navigationController?.pushViewController(addPersonController, animated: true)
    }
    
    //MARK: got the new person back and delegated to ViewController...
    func delegateOnAddPerson(person: Person, index: Int) {
        self.bill.people[index] = person
        personList.tableViewPerson.reloadData()
    }
    
    //MARK: remove a selected person
    func delegateOnRemovePerson(index: Int) {
        self.bill.people.remove(at: index)
        self.peopleControllers.remove(at: index)
        personList.tableViewPerson.reloadData()
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomButton.heightAnchor.constraint(equalToConstant: 100) // Adjust the height as needed
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bill.people.count
    }
    
    //MARK: controlling the view of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "people", for: indexPath) as! PersonTableViewCell
        
        cell.labelName.text = self.bill.people[indexPath.row].name
        var defaultValue = "N/A"
        cell.labelVenmo.text = "Venmo: \(self.bill.people[indexPath.row].venmo ?? defaultValue)"
        
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
