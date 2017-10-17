//
//  ReadableInRealTime+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public extension ReadableInRealTime where Self: FirebaseModel {
    
   @discardableResult static func observeAll(completion: @escaping (_ object: [Self]
        ) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.observe(.value) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
        return handle
    }
    
   @discardableResult static func observeFind(completion: @escaping (_ objects: [Self]) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle? = 0
        handle = Self.fireRecordQuery?.observe(.value) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
        return handle ?? 0
    }
}
