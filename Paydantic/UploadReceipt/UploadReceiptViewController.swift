//
//  UploadReceiptViewController.swift
//  Paydantic
//
//  Created by Ma on 1/2/24.
//

import UIKit
import PhotosUI

class UploadReceiptViewController: UIViewController {
    
    //MARK: delegate to ViewController when getting back...
    var delegate: ViewController!
    
    //MARK: variable to store the picked Image...
    var pickedImage:UIImage?
    
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
        navigationController?.pushViewController(itemListController, animated: true)
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
