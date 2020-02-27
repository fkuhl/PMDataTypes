//
//  File.swift
//  
//
//  Created by Frederick Kuhl on 2/27/20.
//  The document in MongoDB that represents a complete Household, with embedded Members, Address.
//

import Foundation

public struct HouseholdDocument: DataType {
    public var id: Id
    public var value: HouseholdDocumentValue
    
    public init(id: Id, value: ValueType) {
        self.id = id
        self.value = value as! HouseholdDocumentValue
    }
}

public struct HouseholdDocumentValue: ValueType {
    public var head: Member
    public var spouse: Member?
    public var others: [Member] = []
    public var address: Address? //nil if address unknown
}
