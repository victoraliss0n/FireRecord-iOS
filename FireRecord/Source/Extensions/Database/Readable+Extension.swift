//
//  Readable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 18/08/17.
//

import Foundation
import FirebaseCommunity

public extension Readable where Self: FirebaseModel {
    static func all(completion: @escaping (_ object: [Self]
        ) -> Void)  {
        Self.classPath.observe(.value) { snapshot in
            let dataSnapshot = snapshot.children.allObjects as? [DataSnapshot]
            let arraySelf = dataSnapshot?.flatMap({Self.deserialize(from: $0.value as? NSDictionary)})
            if let objects = arraySelf {
                completion(objects)
            }
        }
    }
    static func limit(value: Int8) -> Self.Type {
        return self
    }

}
