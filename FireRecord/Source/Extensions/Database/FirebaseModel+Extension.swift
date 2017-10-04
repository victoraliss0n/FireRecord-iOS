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
        guard let snapshots = snapshot.children.allObjects as? [DataSnapshot] else { return nil }
        let keys = snapshots.map { $0.key }
        let firebaseModels = ( snapshots.flatMap{ Self.deserialize(from: $0.value as? NSDictionary) })
            .enumerated()
            .flatMap { index, model -> Self in
                model.key = keys[index]
                var mutableModel = model
                mutableModel.deserializeStorablePaths(snapshot: snapshots[index])
                return mutableModel
        }
        return firebaseModels
    }
    internal static func getFirebaseModel(from snapshot: DataSnapshot) -> Self? {
        guard let json = snapshot.value as? NSDictionary else { return nil }
        let firebaseModel = Self.deserialize(from: json)
        firebaseModel?.key = snapshot.key
        return firebaseModel
    }
}
