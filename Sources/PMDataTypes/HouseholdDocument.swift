//
//  HouseholdDocument.swift
//  
//
//  Created by Frederick Kuhl on 2/27/20.
//

import Foundation

/**
 Household as represented by a MongoDB document.
 */
public struct HouseholdDocument: DataType {
    public var id: Id
    public var value: HouseholdDocumentValue
    
    public init(id: Id, value: ValueType) {
        self.id = id
        self.value = value as! HouseholdDocumentValue
    }
}

public struct HouseholdDocumentValue: ValueType {
    public var head: Member //data cleaned up enough so this isn't ever nil
    public var spouse: Member?
    public var others: [Member] = []
    public var address: Address? //nil if address unknown
}
