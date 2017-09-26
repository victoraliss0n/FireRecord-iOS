//
//  Ordinable+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 25/09/17.
//

import FirebaseCommunity

extension Orderable where Self: FirebaseModel {
    public static func order(byProperty property: String) -> Self.Type {
        Self.fireRecordReference = Self.classPath.queryOrdered(byChild: property) as? DatabaseReference
        return self
    }
}
