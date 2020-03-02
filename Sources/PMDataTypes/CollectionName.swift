//
//  CollectionName.swift
//
//  Created by Frederick Kuhl on 12/18/19.
//

import Foundation

/**
 The MongoDB document collections that  contain our data.
 With denormalized data, there is only one!
 */

public enum CollectionName: String, CaseIterable {
    case households = "Households"
}
