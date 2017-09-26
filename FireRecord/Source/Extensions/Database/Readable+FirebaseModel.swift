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
            if let firebaseModels = Self.getFirebaseModels(snapshot) {completion(firebaseModels)}
        }
    }
    
    static func `where`(value: Any) -> Self.Type {
        Self.fireRecordQuery = Self.fireRecordQuery?.queryEqual(toValue: value)
        return self
    }
    
    static func find(completion: @escaping (_ objects: [Self]) -> Void) {
        Self.fireRecordQuery?.observe(.value) { snapshot in
            if let firebaseModels = Self.getFirebaseModels(snapshot) {completion(firebaseModels)}
        }
    }
    
}
