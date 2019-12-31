//
//  Household.swift
//  
//
//  Created by Frederick Kuhl on 11/13/19.
//

import Foundation

public struct Household: DataType {
    public var id: Id
    public var value: HouseholdValue
    
    public init(id: Id, value: HouseholdValue) {
        self.id = id
        self.value = value
    }
}

public struct HouseholdValue: ValueType {
    public var head: Id? //this would have to be an error
    public var spouse: Id?
    public var others: [Id]
    public var address: Id
    
    public init(head: Id, spouse: Id?, others: [Id], address: Id) {
        self.head = head
        self.spouse = spouse
        self.others = others
        self.address = address
    }
}

