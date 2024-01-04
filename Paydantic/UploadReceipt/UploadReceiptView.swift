//
//  UploadReceiptView.swift
//  Paydantic
//
//  Created by Ma on 1/2/24.
//

import UIKit

class UploadReceiptView: UIView {

    var buttonSelectType: UIButton!
    var buttonTakePhoto: UIButton!
    var buttonAdd: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupButtonTakePhoto()
        setupButtonAdd()
        
        initConstraints()
    }
    
    func setupButtonTakePhoto() {
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupButtonAdd() {
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Skip", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            buttonTakePhoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //MARK: setting buttonTakePhoto's height and width..
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            buttonAdd.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 16),
            buttonAdd.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
   
    
    //MARK: unused functions...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
