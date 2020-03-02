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
public struct HouseholdDocument: Codable {
    public static let idFieldName = "id"
    
    public var id: Id = ""
    public var head: Member = Member() //data cleaned up enough so this isn't ever nil
    public var spouse: Member? = nil
    public var others: [Member] = []
    public var address: Address? = nil //nil if address unknown
    
    public init() { }
    
    public func asJSONData() -> Data  {
        return try! jsonEncoder.encode(self)
    }
}
