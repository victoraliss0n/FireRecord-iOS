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
    
    static var path: Reference {
        return reference.child(Self.className)
    }
    static var reference: Reference {
        return Database.database().reference()
    }
    internal static var className: String {
        return String(describing: self)
    }
    static var autoId: String {
        return Self.reference.childByAutoId().key
    }
    
    func toJSON() -> JSON {
        guard let jsonData = try? JSONEncoder().encode(self) else {
            return JSON()
        }
        guard let dictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? JSON ?? JSON() else {
            return JSON()
        }
        return dictionary
    }
}
