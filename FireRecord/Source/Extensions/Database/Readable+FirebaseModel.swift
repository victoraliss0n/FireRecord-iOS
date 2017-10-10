//
//  Readable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 18/08/17.
//

import Foundation
import FirebaseCommunity

public extension Readable where Self: FirebaseModel  {
    
    static func all(completion: @escaping (_ object: [Self]
        ) -> Void)  {
        Self.classPath.observeSingleEvent(of: .value) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
    static func find(completion: @escaping (_ objects: [Self]) -> Void) {
        Self.fireRecordQuery?.observeSingleEvent(of: .value) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
    
    static func find(byKey key: String, completion: @escaping (_ objects: Self) -> Void) {
        Self.classPath.child(key).observeSingleEvent(of: .value) { snapshot in
            if let model = Self.getFirebaseModel(from: snapshot) {
                completion(model)
            }
        }
    }
     func findByKey(completion: @escaping (_ object: Self) -> Void) {
        guard let key = self.key else { return }
        Self.classPath.child(key).observeSingleEvent(of: .value) { snapshot in
            if let model = Self.getFirebaseModel(from: snapshot) {
                completion(model)
            }
        }
    }
    
}
