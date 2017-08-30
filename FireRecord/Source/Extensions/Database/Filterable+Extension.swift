//
//  Filterable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 18/08/17.
//

import Foundation
import FirebaseCommunity

public extension Filterable where Self: FirebaseModel  {
    static func findFirst(completion: @escaping (_ object: Self) -> Void)  {
        Self.classPath.queryLimited(toFirst: 1).observe(.value) { snapshot in
            let object = Self.getObject(snapshot)
            if let firebaseModel = object {
                completion(firebaseModel)
            }
        }
    }
    static func findLast(completion: @escaping (_ object: Self) -> Void) {
        Self.classPath.queryLimited(toLast: 1).observe(.value) { snapshot in
            let object = Self.getObject(snapshot)
            if let firebaseModel = object {
                completion(firebaseModel)
            }
        }
    }
    
    internal static func getObject(_ snapshot: DataSnapshot) -> Self? {
        let dataSnapshot = snapshot.children.allObjects.first as? DataSnapshot
        let object = dataSnapshot.flatMap({Self.deserialize(from: $0.value as? NSDictionary)})
        object?.key = dataSnapshot?.key
        return object
    }
}

