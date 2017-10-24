//
//  ReadableInRealTime+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public extension ReadableInRealTime where Self: FirebaseModel {
    
   @discardableResult static func observeAll(when propertyEventType: PropertyEventType, completion: @escaping (_ object: [Self]
        ) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.observe(propertyEventType.rawValue) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
        return handle
    }
    
   @discardableResult static func observeFind(when propertyEventType: PropertyEventType, completion: @escaping (_ objects: [Self]) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle? = 0
        handle = Self.fireRecordQuery?.observe(propertyEventType.rawValue) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
        return handle ?? 0
    }
}
