//
//  Ordinable+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 25/09/17.
//

import FirebaseCommunity

extension Orderable where Self: FirebaseModel {
    public static func order(byProperty property: String) -> Self.Type {
        Self.fireRecordQuery = Self.classPath.queryOrdered(byChild: property)
        return self
    }
    public static func orderByValue() -> Self.Type {
        Self.fireRecordQuery = Self.classPath.queryOrderedByValue()
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
