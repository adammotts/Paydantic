//
//  PersonTableViewCell.swift
//  Paydantic
//
//  Created by Ma on 12/30/23.
//

import UIKit

class CalculationsTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    
    var labelName: UILabel!
    var labelVenmo: UILabel!
    var labelTotal: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupLabelName()
        setupLabelVenmo()
        setupLabelTotal()
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

    func setupLabelVenmo() {
        labelVenmo = UILabel()
        labelVenmo.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelVenmo)
    }
    
    func setupLabelTotal() {
        labelTotal = UILabel()
        labelTotal.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTotal)
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
            
            labelVenmo.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelVenmo.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelVenmo.heightAnchor.constraint(equalToConstant: 20),
            
            labelTotal.topAnchor.constraint(equalTo: labelVenmo.bottomAnchor, constant: 4),
            labelTotal.leadingAnchor.constraint(equalTo: labelVenmo.leadingAnchor),
            labelTotal.heightAnchor.constraint(equalToConstant: 20),
            
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
