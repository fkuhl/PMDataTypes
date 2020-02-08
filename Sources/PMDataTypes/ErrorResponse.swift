//
//  PeriMeleonResponse.swift
//
//  Created by Frederick Kuhl on 9/12/19.
//

import Foundation

/**
 Data type returned by pm-http-server to represent an error.
 */
public struct ErrorResponse: Codable {
    public let error: String
    public let response: String
    
    public init(error: String, response: String) {
        self.error = error
        self.response = response
    }
}
