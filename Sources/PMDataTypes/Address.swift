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
    public var addressU: String {
        get { address ?? "" }
        set { address = newValue }
    }
    public var address2: String? = nil
    public var address2U: String {
        get { address2 ?? "" }
        set { address2 = newValue }
    }
    public var city: String? = ""
    public var cityU: String {
        get { city ?? "" }
        set { city = newValue }
    }
    public var state: String? = nil
    public var stateU: String {
        get { state ?? "" }
        set { state = newValue }
    }
    public var postalCode: String? = ""
    public var postalCodeU: String {
        get { postalCode ?? "" }
        set { postalCode = newValue }
    }
    public var country: String? = nil
    public var countryU: String {
        get { country ?? "" }
        set { country = newValue }
    }
    public var email: String? = nil
    public var emailU: String {
        get { email ?? "" }
        set { email = newValue }
    }
    public var homePhone: String? = nil
    public var homePhoneU: String {
        get { homePhone ?? "" }
        set { homePhone = newValue }
    }

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
