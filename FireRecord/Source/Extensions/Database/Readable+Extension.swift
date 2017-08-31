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
            let arraySelf = Self.getFirebaseModels(snapshot)
            if let objects = arraySelf {
                completion(objects)
            }
        }
    }
}
