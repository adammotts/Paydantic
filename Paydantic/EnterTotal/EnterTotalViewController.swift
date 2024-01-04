//
//  UploadReceiptViewController.swift
//  Paydantic
//
//  Created by Ma on 1/2/24.
//

import UIKit
import PhotosUI

class EnterTotalViewController: UIViewController {
    
    //MARK: delegate to ViewController when getting back...
    var delegate: ItemListViewController!
    
    //MARK: initializing the ADDExpenseView...
    let enterTotalScreen = EnterTotalView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = enterTotalScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Total"
        
        //MARK: adding the action for tapping on buttonAdd...
        enterTotalScreen.buttonAdd.addTarget(self, action: #selector(onNextButtonTapped), for: .touchUpInside)
    }
    
    @objc func onNextButtonTapped() {
        print("Next From Enter Total")
    }

}
