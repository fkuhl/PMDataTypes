//
//  Address.swift
//  
//
//  Created by Frederick Kuhl on 11/13/19.
//

import Foundation

/**
 Address as used in Household, or for tempAddress in Member.
 These are alweays embedded, hence no id.
 The eMail and homePhone are for an entire household.
 The phone especially is becoming obsolete as families drop their land lines.
 */

public struct Address: Codable {
    public var address: String? = ""
    public var address2: String? = nil
    public var city: String? = ""
    public var state: String? = nil
    public var postalCode: String? = ""
    public var country: String? = nil
    public var email: String? = nil
    public var homePhone: String? = nil
    
    public init() { }
    
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
    
    public func asJSONData() -> Data  {
        return try! jsonEncoder.encode(self)
    }
}
