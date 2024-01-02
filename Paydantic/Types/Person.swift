//
//  Person.swift
//  Paydantic
//
//  Created by Ma on 12/29/23.
//

import Foundation

class Person {
    var name: String?
    var venmo: String?
    var total: Double
    
    init(name: String? = nil, venmo: String? = nil) {
        self.name = name
        self.venmo = venmo
        self.total = 0
    }
    
    func addCost(cost: Double) {
        self.total += cost
    }
    
    func computeTotal(ratio: Double) {
        self.total *= ratio
    }
}
