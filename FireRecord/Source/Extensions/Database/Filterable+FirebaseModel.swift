//
//  Filterable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 18/08/17.
//

import Foundation
import FirebaseCommunity

public extension Filterable where Self: FirebaseModel  {
    static func findFirst(completion: @escaping (_ object: Self) -> Void)  {
        Self.classPath.queryLimited(toFirst: 1).observeSingleEvent(of: .value) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot)?.first{completion(firebaseModel)}
        }
    }
    static func findLast(completion: @escaping (_ object: Self) -> Void) {
        Self.classPath.queryLimited(toLast: 1).observeSingleEvent(of: .value) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot)?.first {completion(firebaseModel)}
        }
    }
    static func findFirst(_ toFirst: UInt, completion: @escaping (_ object: [Self]) -> Void) {
        Self.classPath.queryLimited(toFirst: toFirst).observeSingleEvent(of: .value) { snapshot in
            if let firebaseModel = Self.getFirebaseModels(snapshot) {completion(firebaseModel)}
        }
    }
    static func findLast(_ toLast: UInt, completion: @escaping (_ object: [Self]) -> Void) {
        Self.classPath.queryLimited(toLast: toLast).observeSingleEvent(of: .value) { snapshot in
            if let firebaseModels = Self.getFirebaseModels(snapshot) {completion(firebaseModels)}
        }
    }
   
}

