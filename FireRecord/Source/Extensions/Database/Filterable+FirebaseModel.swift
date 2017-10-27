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
        if let fireRecordQuery = Self.fireRecordQuery?.queryLimited(toFirst: 1) {
            Self.executeGenericFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModel in
                completion(firebaseModel)
            })
        } else {
            let fireRecordQuery = Self.classPath.queryLimited(toFirst: 1)
            Self.executeGenericFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModel in
                completion(firebaseModel)
            })
        }
    }
    fileprivate static func executeGenericFind(with reference: DatabaseQuery, and propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void) {
        reference.observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot).first {
                completion(firebaseModel)
            }
        }
    }
    fileprivate static func executeFind(with databaseQuery: DatabaseQuery, and propertyEventType: PropertyEventType, completion: @escaping (_ objects: [Self]) -> Void) {
        databaseQuery.observeSingleEvent(of: propertyEventType.rawValue) { snapshot in
            let firebaseModels = Self.getFirebaseModels(snapshot)
            completion(firebaseModels)
        }
    }
    
    static func findLast(when propertyEventType: PropertyEventType, completion: @escaping (_ object: Self) -> Void) {
        if let fireRecordQuery = Self.fireRecordQuery?.queryLimited(toLast: 1) {
            Self.executeGenericFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModel in
                completion(firebaseModel)
            })
        } else {
            let fireRecordQuery = Self.classPath.queryLimited(toLast: 1)
            Self.executeGenericFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModel in
                completion(firebaseModel)
            })
        }
    }
    static func findFirst(when propertyEventType: PropertyEventType, _ toFirst: UInt, completion: @escaping (_ object: [Self]) -> Void) {
        if let fireRecordQuery = Self.fireRecordQuery?.queryLimited(toFirst: toFirst) {
            Self.executeFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModels in
                completion(firebaseModels)
            })
        } else {
            let fireRecordQuery = Self.classPath.queryLimited(toFirst: toFirst)
            Self.executeFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModels in
                completion(firebaseModels)
            })
        }
    }
    
    static func findLast(when propertyEventType: PropertyEventType, _ toLast: UInt, completion: @escaping (_ object: [Self]) -> Void) {
        if let fireRecordQuery = Self.fireRecordQuery?.queryLimited(toLast: toLast) {
            Self.executeFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModels in
                completion(firebaseModels)
            })
        } else {
            let fireRecordQuery = Self.classPath.queryLimited(toLast: toLast)
            Self.executeFind(with: fireRecordQuery, and: propertyEventType, completion: { firebaseModels in
                completion(firebaseModels)
            })
        }
    }
   
}

