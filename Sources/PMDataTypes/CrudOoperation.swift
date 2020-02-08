//
//  CrudOoperation.swift
//
//  Created by Frederick Kuhl on 12/18/19.
//

import Foundation

/**
 The CRUD operations that pm-http-server can perform.
 */
public enum CrudOperation: String {
    case create
    case read
    case readAll
    case update
    case delete
    case drop
}
