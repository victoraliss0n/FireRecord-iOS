//
//  Readable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Readable: Filterable, Orderable {
    static func all(when propertyEventType: PropertyEventType, completion: @escaping (_ objects: [FireRecordType]) -> Void)
    static func find(when propertyEventType: PropertyEventType, completion: @escaping (_ objects: [FireRecordType]) -> Void)
    func findByKey(when propertyEventType: PropertyEventType, completion: @escaping (_ object: FireRecordType) -> Void)
    static func find(when propertyEventType: PropertyEventType, byKey key: String, completion: @escaping (_ object: FireRecordType) -> Void)

}

