//
//  Filterable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Filterable {
    associatedtype FireRecordType
    
    static func findFirst(when propertyEventType: PropertyEventType, completion: @escaping (_ object: FireRecordType) -> Void)
    static func findLast(when propertyEventType: PropertyEventType, completion: @escaping (_ object: FireRecordType) -> Void)
    static func findFirst(when propertyEventType: PropertyEventType, _ toFirst: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)
    static func findLast(when propertyEventType: PropertyEventType, _ toLast: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)
}

