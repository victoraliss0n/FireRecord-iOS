//
//  FirebaseModel+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation
import FirebaseCommunity

public extension FirebaseModel {
    typealias JSON = [String: Any]
    
    internal static var classPath: DatabaseReference {
        return reference.child(Self.className)
    }
    static var reference: DatabaseReference {
        return Database.database().reference()
    }
    internal static var className: String {
        return String(describing: self)
    }
    internal static var autoId: String {
        return Self.reference.childByAutoId().key
    }
    func toJSON() -> JSON {
        return toJSON()
    }
}
