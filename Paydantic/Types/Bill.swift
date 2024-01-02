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
    
    init() {
        self.people = [Person]()
        self.items = [Item]()
        self.subtotal = 0
        self.total = 0
    }
    
    func addPerson(person: Person) {
        self.people.append(person)
    }
    
    func notifyPeople(ratio: Double) {
        var ratio = total / subtotal
        
        for person in people {
            person.computeTotal(ratio: ratio)
        }
    }
}
