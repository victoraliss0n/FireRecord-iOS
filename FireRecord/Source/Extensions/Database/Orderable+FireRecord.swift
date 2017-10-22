//
//  Orderable+FireRecord.swift
//  FirebaseCommunity
//
//  Created by Vitor Muniz on 09/10/17.
//

import Foundation

extension Orderable where Self: FireRecord {
    public static func order(by property: PartialKeyPath<Self>) -> Self.Type {
        
        if let propertyLabel = property._kvcKeyPathString {
            Self.fireRecordQuery = Self.classPath.queryOrdered(byChild: propertyLabel)
        }
        return self
    }
}
