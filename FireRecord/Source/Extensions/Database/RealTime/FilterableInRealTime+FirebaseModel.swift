//
//  FilterableInRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public extension FilterableInRealTime where Self: FirebaseModel {
    @discardableResult static func observeFindFirst(when propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void)  -> DatabaseHandle  {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toFirst: 1).observe(propertyEventType.rawValue) { snapshot in
             if let firebaseModel = Self.getFirebaseModels(snapshot).first { completion(firebaseModel) }
        }
        return handle
    }
    @discardableResult static func observeFindLast(when propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toLast: 1).observe(propertyEventType.rawValue) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot).first { completion(firebaseModel) }
        }
        return handle
    }
    @discardableResult static func observeFindFirst(when propertyEventType: PropertyEventType, _ toFirst: UInt, completion: @escaping (_ object: [Self]) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toFirst: toFirst).observe(propertyEventType.rawValue) { snapshot in
            let firebaseModel = Self.getFirebaseModels(snapshot)
            completion(firebaseModel)
        }
        return handle
    }
    
    @discardableResult static func observeFindLast(when propertyEventType: PropertyEventType, _ toLast: UInt, completion: @escaping (_ object: [Self]) -> Void) -> DatabaseHandle {
        var handle: DatabaseHandle = 0
        handle = Self.classPath.queryLimited(toLast: toLast).observe(propertyEventType.rawValue) { snapshot in
             let firebaseModels = Self.getFirebaseModels(snapshot)
             completion(firebaseModels)
        }
        return handle
    }
}
