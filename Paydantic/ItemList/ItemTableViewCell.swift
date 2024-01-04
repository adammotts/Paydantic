//
//  PersonTableViewCell.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    
    var labelName: UILabel!
    var labelCost: UILabel!
    var labelConsumers: UILabel!
    
    //Insert dropdown input with all people
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelName()
        setupLabelCost()
        setupLabelConsumers()
        initConstraints()
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }

    func setupLabelCost() {
        labelCost = UILabel()
        labelCost.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelCost)
    }
    
    func setupLabelConsumers() {
        labelConsumers = UILabel()
        labelConsumers.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelConsumers)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            labelCost.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelCost.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelCost.heightAnchor.constraint(equalToConstant: 20),
            
            labelConsumers.topAnchor.constraint(equalTo: labelCost.bottomAnchor, constant: 4),
            labelConsumers.leadingAnchor.constraint(equalTo: labelCost.leadingAnchor),
            labelConsumers.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
