//
//  DataType.swift
//  Async
//
//  Created by Frederick Kuhl on 11/29/19.
//

import Foundation

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
    return d
}()

public let jsonEncoder: JSONEncoder = {
    let e = JSONEncoder()
    e.dateEncodingStrategy = .formatted(dateFormatter)
    e.outputFormatting = .prettyPrinted
    return e
}()


public typealias Id = String

public protocol ValueType: Encodable, Decodable { }

extension ValueType {
    public func asJSONData() -> Data  {
        return try! jsonEncoder.encode(self)
    }
}

public protocol DataType: Encodable, Decodable {
    associatedtype V: ValueType
    
    var id: Id { get set }
    var value: V { get set }
}
