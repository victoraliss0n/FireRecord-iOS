//
//  FilterableInRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public extension FilterableInRealTime where Self: FirebaseModel {
    @discardableResult static func observeFindFirst(completion: @escaping (_ object: Self) -> Void)  -> DatabaseHandle  {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toFirst: 1).observe(.value) { snapshot in
             if let firebaseModel = Self.getFirebaseModels(snapshot).first { completion(firebaseModel) }
        }
        return handle
    }
    @discardableResult static func observeFindLast(completion: @escaping (_ object: Self) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toLast: 1).observe(.value) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot).first { completion(firebaseModel) }
        }
        return handle
    }
    @discardableResult static func observeFindFirst(_ toFirst: UInt, completion: @escaping (_ object: [Self]) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toFirst: toFirst).observe(.value) { snapshot in
            let firebaseModel = Self.getFirebaseModels(snapshot)
            completion(firebaseModel)
        }
        return handle
    }
    
    @discardableResult static func observeFindLast(_ toLast: UInt, completion: @escaping (_ object: [Self]) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toLast: toLast).observe(.value) { snapshot in
             let firebaseModels = Self.getFirebaseModels(snapshot)
             completion(firebaseModels)
        }
        return handle
    }
}
