//
//  UploadReceiptViewController.swift
//  Paydantic
//
//  Created by Ma on 1/2/24.
//

import UIKit
import PhotosUI
import Vision
import NaturalLanguage

class UploadReceiptViewController: UIViewController {
    
    //MARK: delegate to ViewController when getting back...
    var delegate: ViewController!
    
    //MARK: variable to store the picked Image...
    var pickedImage: UIImage?
    
    //MARK: initializing the ADDExpenseView...
    let uploadReceiptScreen = UploadReceiptView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = uploadReceiptScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upload Receipt"
        
        //MARK: adding menu to buttonTakePhoto...
        uploadReceiptScreen.buttonTakePhoto.menu = getMenuImagePicker()
        
        //MARK: adding the action for tapping on buttonAdd...
        uploadReceiptScreen.buttonAdd.addTarget(self, action: #selector(onNextButtonTapped), for: .touchUpInside)
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onNextButtonTapped() {
        let itemListController = ItemListViewController()
        
        if (pickedImage != nil) {
            performOCR(on: pickedImage!, itemListController: itemListController)
        }
        
        navigationController?.pushViewController(itemListController, animated: true)
    }

    func performOCR(on image: UIImage, itemListController: ItemListViewController) {
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }

            let sortedObservations = observations.sorted { (obs1, obs2) -> Bool in
                // Custom sorting logic: Compare y-coordinates first, then x-coordinates
                if obs1.boundingBox.minY != obs2.boundingBox.minY {
                    return obs1.boundingBox.minY > obs2.boundingBox.minY
                }
                return obs1.boundingBox.minX < obs2.boundingBox.minX
            }

            let recognizedText = sortedObservations.compactMap { $0.topCandidates(1).first?.string }
            print(recognizedText)
            
            for index in recognizedText.indices[1...] {
                var money = recognizedText[index]
                var food = recognizedText[index - 1]
                
                if (self.isPotentiallyMoney(money) && self.isPotentiallyFood(food)) {
                    print("\(food): \(money)")
                    
                    var moneyAmount = self.convertToMoney(money)
                    
                    Bill.items.append(Item(name: food, cost: moneyAmount))
                    
                    let addItemController = AddItemViewController()
                    addItemController.delegate = itemListController
                    addItemController.index = itemListController.itemControllers.count
                    addItemController.addItemScreen.textFieldName.text = food
                    addItemController.addItemScreen.textFieldCost.text = String(moneyAmount)
                    itemListController.itemControllers.append(addItemController)
                }
            }
        }
        request.recognitionLevel = .accurate

        guard let cgImage = image.cgImage else { return }
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([request])
    }
    
    //Check if the string is a Double or starts with a $
    func isPotentiallyMoney(_ input: String) -> Bool {
        if input.hasPrefix("$") {
            return true
        }

        if Double(input) != nil {
            return true
        }
        
        return false
    }
     
    func isPotentiallyFood(_ input: String) -> Bool {
        var moneyRelated: Set<String> = ["subtotal", "tax", "total", "cash", "change", "balance"]
        
        if (input.lowercased().split { !$0.isLetter }.contains { moneyRelated.contains(String($0)) }) {
            return false
        }
        
        if (isPotentiallyMoney(input)) {
            return false
        }
        
        return true
    }
    
    func convertToMoney(_ input: String) -> Double {
        var money = input
        
        if input.hasPrefix("$") {
            money = String(input.dropFirst())
        }
        
        return Double(money) ?? 0.0
    }
}

//MARK: adopting required protocols for PHPicker...
extension UploadReceiptViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage {
                            self.uploadReceiptScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                            
                            self.uploadReceiptScreen.buttonAdd.setTitle("Done Uploading Receipt", for: .normal)
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension UploadReceiptViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            self.uploadReceiptScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
            
            uploadReceiptScreen.buttonAdd.setTitle("Done Uploading Receipt", for: .normal)
        }
        else {
            uploadReceiptScreen.buttonAdd.setTitle("Skip", for: .normal)
        }
    }
}
