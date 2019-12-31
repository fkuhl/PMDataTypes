//
//  Member.swift
//  pm-http-server
//
//  Created by Frederick Kuhl on 9/12/19.
//

import Foundation

public enum TransactionType: String, Encodable, Decodable {
    case BIRTH
    case PROFESSION
    case RECEIVED
    case SUSPENDED
    case SUSPENSION_LIFTED
    case EXCOMMUNICATED
    case RESTORED
    case DISMISSAL_PENDING
    case DISMISSED
    case REMOVED_ADMIN
    case DIED
}

public struct Transaction: Encodable, Decodable {
    public var index: Id
    public var date: Date?
    public var type: TransactionType
    public var authority: String?
    public var church: String?
    public var comment: String?
}

public enum ServiceType: String, Encodable, Decodable {
    case ORDAINED_TE
    case ORDAINED_RE
    case ORDAINED_DE
    case INSTALLED_TE
    case INSTALLED_RE
    case INSTALLED_DE
    case REMOVED
    case EMERITUS
    case HON_RETIRED
    case DEPOSED
}

public struct Service: Encodable, Decodable {
    public var index: Id
    public var date: Date?
    public var type: ServiceType
    public var place: String?
    public var comment: String?
}

public enum Sex: String, Encodable, Decodable {
    case MALE
    case FEMALE
}

public enum MemberStatus: String, Encodable, Decodable {
    case NONCOMMUNING
    case COMMUNING
    case ASSOCIATE
    case EXCOMMUNICATED
    case SUSPENDED
    case DISMISSAL_PENDING
    case DISMISSED
    case REMOVED
    case DEAD
    case PASTOR
    
    /** Function rather than computed property, because property would interfere with encoding and decoding. */
    public func isActive() -> Bool {
        switch self {
        case .NONCOMMUNING, .COMMUNING, .ASSOCIATE, .PASTOR, .SUSPENDED:
            return true
        default:
            return false
        }
    }
}

public enum MaritalStatus: String, Encodable, Decodable {
    case SINGLE
    case MARRIED
    case DIVORCED
}

public struct Member: DataType {
    public var id: Id
    public var value: MemberValue
}

public struct MemberValue: ValueType {
    public var familyName: String
    public var givenName: String
    public var middleName: String?
    public var previousFamilyName: String?
    public var nameSuffix: String?
    public var title: String?
    public var nickName: String?
    public var sex: Sex
    public var dateOfBirth: Date?
    public var placeOfBirth: String?
    public var status: MemberStatus
    public var resident: Bool
    public var exDirectory: Bool
    public var household: Id
    public var tempAddress: Id?
    public var transactions: [Transaction]
    public var maritalStatus: MaritalStatus
    public var spouse: String?
    public var dateOfMarriage: Date?
    public var divorce: String?
    public var father: Id?
    public var mother: Id?
    public var eMail: String?
    public var workEMail: String?
    public var mobilePhone: String?
    public var workPhone: String?
    public var education: String?
    public var employer: String?
    public var baptism: String?
    public var services: [Service]
    public var dateLastChanged: Date?
    
    /** A function, not computed property, because a computed property interferes with encoding and decoding. */
    public func fullName() -> String {
        let previousContribution = nugatory(previousFamilyName) ? "" : " (\(previousFamilyName!))"
        let nickContribution = nugatory(nickName) ? "" : " \"\(nickName!)\""
        let middleContribution = nugatory(middleName) ? "" : " \(middleName!)"
        return "\(familyName), \(givenName)\(middleContribution)\(previousContribution)\(nickContribution)"
    }
}

    fileprivate func nugatory(_ thing: String?) -> Bool {
        return thing == nil || thing == ""
    }
