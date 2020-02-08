//
//  CollectionName.swift
//
//  Created by Frederick Kuhl on 12/18/19.
//

import Foundation

/**
 The MongoDB document collections that  contain our data.
 */

public enum CollectionName: String, CaseIterable {
    case members = "Members"
    case households = "Households"
    case addresses = "Addresses"
}
