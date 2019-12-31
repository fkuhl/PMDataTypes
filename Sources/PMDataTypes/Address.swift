//
//  Address.swift
//  
//
//  Created by Frederick Kuhl on 11/13/19.
//

import Foundation

public struct Address: DataType {
    public init(id: Id, value: ValueType) {
        self.id = id
        self.value = value as! AddressValue
        
    }
    
    public var id: Id
    public var value: AddressValue
    
//    public init(id: Id, value: AddressValue) {
//        self.id = id
//        self.value = value
//    }
}

/** default values just for mocking */
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
