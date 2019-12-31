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
}

public struct HouseholdValue: ValueType {
    public var head: Id? //this would have to be an error
    public var spouse: Id?
    public var others: [Id]
    public var address: Id
}

