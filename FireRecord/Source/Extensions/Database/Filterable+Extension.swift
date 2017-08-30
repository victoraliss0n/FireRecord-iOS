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
        Self.classPath.queryLimited(toLast: 1).observeSingleEvent(of: .value) { snapshot in
            let dataSnapshot = snapshot.children.allObjects.first as? DataSnapshot
            let object = dataSnapshot.flatMap({Self.deserialize(from: $0.value as? NSDictionary)})
            object?.key = dataSnapshot?.key
            if let firebaseModel = object {
                completion(firebaseModel)
            }
        }
    }
}

