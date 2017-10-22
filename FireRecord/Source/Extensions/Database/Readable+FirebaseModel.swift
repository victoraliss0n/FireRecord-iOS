//
//  Readable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 18/08/17.
//

import Foundation
import FirebaseCommunity

public extension Readable where Self: FirebaseModel  {
    
    static func all(when propertyEventType: PropertyEventType, completion: @escaping (_ object: [Self]
        ) -> Void)  {
        Self.classPath.observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
    static func find(when propertyEventType: PropertyEventType, completion: @escaping (_ objects: [Self]) -> Void) {
        Self.fireRecordQuery?.observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
    
    static func find(when propertyEventType: PropertyEventType, byKey key: String, completion: @escaping (_ objects: Self) -> Void) {
        Self.classPath.child(key).observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            if let model = Self.getFirebaseModel(from: snapshot) {
                completion(model)
            }
        }
    }
     func findByKey(when propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void) {
        guard let key = self.key else { return }
        Self.classPath.child(key).observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            if let model = Self.getFirebaseModel(from: snapshot) {
                completion(model)
            }
        }
    }
    
}
