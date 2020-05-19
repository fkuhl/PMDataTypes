//
//  Member.swift
//
//  Created by Frederick Kuhl on 9/12/19.
//

import Foundation

/**
 A member, communing or noncommuning.
 */

public enum TransactionType: String, CaseIterable, Codable {
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

public struct Transaction: Codable, Hashable {
    public var index: Id?  //irrelevant artifact of Java PM?
    public var date: Date?
    public var type: TransactionType
    public var authority: String?
    public var church: String?
    public var comment: String?
}

public enum ServiceType: String, CaseIterable, Codable {
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

public struct Service: Codable, Hashable {
    public var index: Id?  //irrelevant artifact of Java PM?
    public var date: Date?
    public var type: ServiceType
    public var place: String?
    public var comment: String?
}

public enum Sex: String, CaseIterable, Codable {
    case MALE
    case FEMALE
}

/**
 In the new system, the status field should not be set directly, but should be derived
 from the most recently added Transaction.
 So why maintain it? For backward compatibility: Transactions were a late addition to PM
 when the need was realized for a time-sequenced series of changes in status.
 */
public enum MemberStatus: String, CaseIterable, Codable {
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

public enum MaritalStatus: String, CaseIterable, Codable {
    case SINGLE
    case MARRIED
    case DIVORCED
}

/** Default values are merely to aid making mock objects. */
public struct Member: Codable {
    public var id: Id
    public var familyName: String = ""
    public var givenName: String = ""
    public var middleName: String? = nil
    public var middleNameU: String {
        get { middleName ?? "" }
        set { middleName = newValue }
    }
    public var previousFamilyName: String? = nil
    public var previousFamilyNameU: String {
        get { previousFamilyName ?? "" }
        set { previousFamilyName = newValue }
    }
    public var nameSuffix: String? = nil
    public var nameSuffixU: String {
        get { nameSuffix ?? "" }
        set { nameSuffix = newValue }
    }
    public var title: String? = nil
    public var titleU: String {
        get { title ?? "" }
        set { title = newValue }
    }
    public var nickName: String? = nil
    public var nickNameU: String {
        get { nickName ?? "" }
        set { nickName = newValue }
    }
    public var sex: Sex = .MALE
    public var dateOfBirth: Date? = nil
    public var placeOfBirth: String? = nil
    public var placeOfBirthU: String {
        get { placeOfBirth ?? "" }
        set { placeOfBirth = newValue }
    }
    public var status: MemberStatus = .COMMUNING
    public var resident: Bool = true
    public var exDirectory: Bool = false
    public var household: Id = "" //Even DEAD members have a household
    public var tempAddress: Address? = nil
    public var transactions: [Transaction] = []
    public var maritalStatus: MaritalStatus = .SINGLE
    public var spouse: String? = nil
    public var spouseU: String {
        get { spouse ?? "" }
        set { spouse = newValue }
    }
    public var dateOfMarriage: Date? = nil
    public var divorce: String? = nil
    public var divorceU: String {
        get { divorce ?? "" }
        set { divorce = newValue }
    }
    public var father: Id? = nil
    public var mother: Id? = nil
    public var eMail: String? = nil
    public var eMailU: String {
        get { eMail ?? "" }
        set { eMail = newValue }
    }
    public var workEmail: String? = nil
    public var workEmailU: String {
        get { workEmail ?? "" }
        set { workEmail = newValue }
    }
    public var mobilePhone: String? = nil
    public var mobilePhoneU: String {
        get { mobilePhone ?? "" }
        set { mobilePhone = newValue }
    }
    public var workPhone: String? = nil
    public var workPhoneU: String {
        get { workPhone ?? "" }
        set { workPhone = newValue }
    }
    //public var education: String? = nil
    //public var employer: String? = nil
    public var baptism: String? = nil
    public var baptismU: String {
        get { baptism ?? "" }
        set { baptism = newValue }
    }
    public var services: [Service] = []
    public var dateLastChanged: Date? = nil
    
    public init() {
        self.id = UUID().uuidString
    }
    
    
    /** just for mocking */
    public init(
        familyName: String,
        givenName: String,
        middleName: String?,
        previousFamilyName: String,
        nickName: String?,
        sex: Sex,
        household: Id,
        eMail: String?,
        mobilePhone: String?,
        education: String?,
        employer: String?,
        baptism: String?
    ) {
        self.id = UUID().uuidString
        self.familyName = familyName
        self.givenName = givenName
        self.middleName = middleName
        self.previousFamilyName = previousFamilyName
        self.nickName = nickName
        self.sex = sex
        self.household = household
        self.eMail = eMail
        self.mobilePhone = mobilePhone
        //self.education = education
        //""self.employer = employer
        self.baptism = baptism
    }
    
    public func isEmpty() -> Bool {
        return nugatory(familyName) && nugatory(givenName)
    }
    
    /** A function, not computed property, because a computed property interferes with encoding and decoding. */
    public func fullName() -> String {
        if self.isEmpty() { return "[no value]" }
        let previousContribution = nugatory(previousFamilyName) ? "" : " (\(previousFamilyName!))"
        let nickContribution = nugatory(nickName) ? "" : " \"\(nickName!)\""
        let middleContribution = nugatory(middleName) ? "" : " \(middleName!)"
        let suffixContrib = nugatory(nameSuffix) ? "" : " \(nameSuffix!)"
        return "\(familyName), \(givenName)\(middleContribution)\(suffixContrib)\(previousContribution)\(nickContribution)"
    }
    
    public func asJSONData() -> Data  {
        return try! jsonEncoder.encode(self)
    }
}

    public func nugatory(_ thing: String?) -> Bool {
        return thing == nil || thing == ""
    }
