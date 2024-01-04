//
//  Person.swift
//  Paydantic
//
//  Created by Ma on 12/29/23.
//

import Foundation

class Person: Equatable, Hashable {
    var name: String
    var venmo: String
    var total: Double
    
    init(name: String = "", venmo: String = "") {
        self.name = name
        self.venmo = venmo
        self.total = 0.0
    }
    
    func addCost(cost: Double) {
        self.total += cost
    }
    
    func computeTotal(ratio: Double) {
        self.total *= ratio
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.venmo == rhs.venmo && lhs.total == rhs.total
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(venmo)
        hasher.combine(total)
    }
}
