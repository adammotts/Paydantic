//
//  Item.swift
//  Paydantic
//
//  Created by Ma on 12/29/23.
//

import Foundation

class Item {
    var name: String
    var cost: Double
    var consumers: [Person]
    
    init(name: String = "", cost: Double = 0.0, consumers: [Person] = []) {
        self.name = name
        self.cost = cost
        self.consumers = consumers
    }
    
    func notifyCost() {
        var splitCost = self.cost / Double(self.consumers.count)
        
        for person in self.consumers {
            person.addCost(cost: splitCost)
        }
    }
}
