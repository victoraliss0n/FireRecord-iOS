//
//  Limitable+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation

public extension Limitable where Self: FirebaseModel {
    
    static func `where`(value: Any) -> Self.Type {
        Self.fireRecordQuery = Self.fireRecordQuery?.queryEqual(toValue: value)
        return self
    }
    
    public static func start(atValue value: Any) -> Self.Type {
        Self.fireRecordQuery = Self.fireRecordQuery?.queryStarting(atValue: value)
        return self
    }
    
    public static func end(atValue value: Any) -> Self.Type {
        Self.fireRecordQuery = Self.fireRecordQuery?.queryEnding(atValue: value)
        return self
    }
    
}
