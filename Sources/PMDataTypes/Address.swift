//
//  Address.swift
//  
//
//  Created by Frederick Kuhl on 11/13/19.
//

import Foundation

/**
 Address as used in Household, or for tempAddress in Member.
 The eMail and homePhone are for an entire household.
 The phone especially is becoming obsolete as families drop their land lines.
 */

public struct Address: DataType {
    public init(id: Id, value: ValueType) {
        self.id = id
        self.value = value as! AddressValue
        
    }
    
    public var id: Id
    public var value: AddressValue
}

public struct AddressValue: ValueType {
    public var address: String
    public var address2: String? = nil
    public var city: String
    public var state: String?
    public var postalCode: String
    public var country: String? = nil
    public var eMail: String? = nil
    public var homePhone: String? = nil
    
    /** only for mocking */
    public init(
        address: String,
        city: String,
        state: String?,
        postalCode: String
    ) {
        self.address = address
        self.city = city
        self.state = state
        self.postalCode = postalCode
    }
}
