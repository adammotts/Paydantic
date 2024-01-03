//
//  Item.swift
//  Paydantic
//
//  Created by Ma on 12/29/23.
//

import Foundation

class Item {
    var name: String?
    var cost: Double?
    var consumers: [Person]?
    
    init(name: String? = nil, cost: Double? = nil, consumers: [Person]? = nil) {
        self.name = name
        self.cost = cost
        self.consumers = consumers
        
        /*
        var splitCost = cost / Double(consumers.count)
        
        for person in consumers {
            person.addCost(cost: splitCost)
        }
        */
    }
}
