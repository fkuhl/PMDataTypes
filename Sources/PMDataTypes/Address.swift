//
//  Address.swift
//  
//
//  Created by Frederick Kuhl on 11/13/19.
//

import Foundation

public struct Address: DataType {
    public var id: Id
    public var value: AddressValue
}

public struct AddressValue: ValueType {
    public var address: String
    public var address2: String?
    public var city: String
    public var state: String?
    public var postalCode: String
    public var country: String?
    public var eMail: String?
    public var homePhone: String?
}
