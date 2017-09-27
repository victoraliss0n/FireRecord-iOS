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
    func toJSONObject() -> JSON? {
        return toJSON()
    }
    internal static func getFirebaseModels(_ snapshot: DataSnapshot) -> [Self]? {
        let dataSnapshot = snapshot.children.allObjects as? [DataSnapshot]
        let keys = dataSnapshot?.map { $0.key }
        let firebaseModels = (dataSnapshot?
            .flatMap{ Self.deserialize(from: $0.value as? NSDictionary) })?
            .enumerated()
            .flatMap { offset, element -> Self in element.key = keys?[offset]; return element }
        return firebaseModels
    }
}
