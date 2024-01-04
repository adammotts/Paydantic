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
    static var total = 0.0
    
    init() {
    }
    
    static func notifyPeople() {
        
        var subtotal = 0.0
        
        for item in Bill.items {
            item.notifyCost()
            
            subtotal += item.cost
        }
        
        var ratio = Bill.total / subtotal
        
        for person in Bill.people {
            person.computeTotal(ratio: ratio)
        }
    }
}
