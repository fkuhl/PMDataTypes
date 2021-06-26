//
//  File.swift
//  
//
//  Created by Frederick Kuhl on 2/8/20.
//

import Foundation

/**
 Data need to transfer a family.
 */
public struct TransferFamilyData: Codable {
    public var household: ID
    public var date: Date
    public var type: TransactionType
    public var authority: String?
    public var church: String?
    public var comment: String?
}
