//
//  Bill.swift
//  Paydantic
//
//  Created by Ma on 12/29/23.
//

import Foundation

class Bill {
    
    var people: [Person]
    var items: [Item]
    var subtotal: Double
    var total: Double
    
    init(subtotal: Double, total: Double) {
        self.people = [Person]()
        self.items = [Item]()
        self.subtotal = subtotal
        self.total = total
    }
    
    func notifyPeople(ratio: Double) {
        var ratio = total / subtotal
        
        for person in people {
            person.computeTotal(ratio: ratio)
        }
    }
}
