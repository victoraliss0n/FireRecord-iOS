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
}
