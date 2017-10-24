//
//  Filterable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 18/08/17.
//

import Foundation
import FirebaseCommunity

public extension Filterable where Self: FirebaseModel  {
    static func findFirst(when propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void)  {
        Self.classPath.queryLimited(toFirst: 1).observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot).first {
                completion(firebaseModel)
            }
        }
    }
    static func findLast(when propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void) {
        Self.classPath.queryLimited(toLast: 1).observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot).first {
                completion(firebaseModel)
            }
        }
    }
    static func findFirst(when propertyEventType: PropertyEventType, _ toFirst: UInt, completion: @escaping (_ object: [Self]) -> Void) {
        
        Self.classPath.queryLimited(toFirst: toFirst).observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
             let firebaseModel = Self.getFirebaseModels(snapshot)
             completion(firebaseModel)
        }
    }
    static func findLast(when propertyEventType: PropertyEventType, _ toLast: UInt, completion: @escaping (_ object: [Self]) -> Void) {
        Self.classPath.queryLimited(toLast: toLast).observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
   
}

