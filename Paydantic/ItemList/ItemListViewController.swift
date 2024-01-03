//
//  ItemListViewController.swift
//  Paydantic
//
//  Created by Ma on 1/3/24.
//

import UIKit

class ItemListViewController: UIViewController {
    
    let itemList = ItemListView()
    
    var itemControllers = [AddItemViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of Items"
        
        itemList.tableViewItem.delegate = self
        itemList.tableViewItem.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        itemList.bottomButton.addTarget(self, action: #selector(onBottomButtonTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        view = itemList
    }
    
    @objc func onBottomButtonTapped() {
        let uploadReceiptController = UploadReceiptViewController()
        navigationController?.pushViewController(uploadReceiptController, animated: true)
    }
    
    @objc func onAddBarButtonTapped(){
        let addItemController = AddItemViewController()
        addItemController.delegate = self
        addItemController.index = itemControllers.count
        self.itemControllers.append(addItemController)
        Bill.items.append(Item())
        navigationController?.pushViewController(addItemController, animated: true)
    }
    
    //MARK: got the new Item back and delegated to ViewController...
    func delegateOnAddItem(Item: Item, index: Int) {
        Bill.items[index] = Item
        itemList.tableViewItem.reloadData()
    }
    
    //MARK: remove a selected Item
    func delegateOnRemoveItem(index: Int) {
        Bill.items.remove(at: index)
        self.itemControllers.remove(at: index)
        itemList.tableViewItem.reloadData()
    }
}

extension ItemListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bill.items.count
    }
    
    //MARK: controlling the view of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath) as! ItemTableViewCell
        
        cell.labelName.text = Bill.items[indexPath.row].name
        var defaultValue = 0.0
        cell.labelCost.text = "Cost: $\(Bill.items[indexPath.row].cost ?? defaultValue)"
        
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addItemController = self.itemControllers[indexPath.row]
        
        navigationController?.pushViewController(addItemController, animated: true)
    }
    
    //MARK: swipe left to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegateOnRemoveItem(index: indexPath.row)
        }
    }
}
