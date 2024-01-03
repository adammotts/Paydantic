//
//  Bill.swift
//  Paydantic
//
//  Created by Ma on 12/29/23.
//

import Foundation

class Bill {
    
    static var people = [Person]()
    static var items = [Item]()
    static var subtotal = 0.0
    static var total = 0.0
    
    init() {
    }
    
    static func addPerson(person: Person) {
        Bill.people.append(person)
    }
    
    static func notifyPeople() {
        var ratio = Bill.total / Bill.subtotal
        
        for person in Bill.people {
            person.computeTotal(ratio: ratio)
        }
    }
}
