//
//  ReadableInRealTime+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public extension ReadableInRealTime where Self: FirebaseModel {
    
    static func observeAll(completion: @escaping (_ object: [Self]
        ) -> Void)  {
        Self.classPath.observe(.value) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
    
    static func observeFind(completion: @escaping (_ objects: [Self]) -> Void) {
        Self.fireRecordQuery?.observe(.value) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
}
