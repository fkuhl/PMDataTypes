//
//  Household.swift
//  
//
//  Created by Frederick Kuhl on 11/13/19.
//

import Foundation

/**
 A household.
 As you can see, this structure contains nothing but MongoDB ids.
 Single persons each have their own household.
 */
public struct Household: DataType {
    public var id: Id
    public var value: HouseholdValue
    
    public init(id: Id, value: ValueType) {
        self.id = id
        self.value = value as! HouseholdValue
    }
}

public struct HouseholdValue: ValueType {
    public var head: Id //data cleaned up enough so this isn't ever nil
    public var spouse: Id?
    public var others: [Id] = []
    public var address: Id? //nil if address unknown
    
    /** just for mocking */
    public init(head: Id, spouse: Id?, others: [Id], address: Id) {
        self.head = head
        self.spouse = spouse
        self.others = others
        self.address = address
    }
}

