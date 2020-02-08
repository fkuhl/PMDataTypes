//
//  File.swift
//  
//
//  Created by Frederick Kuhl on 2/8/20.
//

import Foundation

/**
 The data need for a newFamily transaction, i.e., adding a complete new family.
 Note that each MemberValue will contain a suitable Transaction.
 */

public struct NewFamilyData: Codable {
    public var head: MemberValue
    public var spouse: MemberValue?
    public var others: [MemberValue]
    public var address: Address
}
