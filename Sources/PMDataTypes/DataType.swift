//
//  DataType.swift
//
//  Created by Frederick Kuhl on 11/29/19.
//

import Foundation

/**
 The Swift generic supertypes for the data types (Member, Household, Address),
 and associated operations.
 "Generic protocol with associated type" is somewhat advanced Swift.
 Nifty when it works.
 */

public let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()

public let jsonDecoder: JSONDecoder = {
    let d = JSONDecoder()
    d.dateDecodingStrategy = .formatted(dateFormatter)
    d.keyDecodingStrategy = .convertFromSnakeCase
    return d
}()

public let jsonEncoder: JSONEncoder = {
    let e = JSONEncoder()
    e.dateEncodingStrategy = .formatted(dateFormatter)
    e.keyEncodingStrategy = .convertToSnakeCase
    e.outputFormatting = .prettyPrinted
    return e
}()


public typealias Id = String

//public protocol ValueType: Codable { }

//extension ValueType {
//    public func asJSONData() -> Data  {
//        return try! jsonEncoder.encode(self)
//    }
//}
//
//public protocol Makable {
//    init(id: Id, value: ValueType)
//}

//public protocol DataType: Codable, Makable {
//    associatedtype V: ValueType
//    
//    var id: Id { get set }
//    var value: V { get set }
//}
