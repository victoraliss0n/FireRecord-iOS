//
//  FilterableInRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity
public protocol FilterableInRealTime {
    associatedtype FireRecordType
    
    static func observeFindFirst(when propertyEventType: PropertyEventType, completion: @escaping (_ object: FireRecordType) -> Void) -> DatabaseHandle
    static func observeFindLast(when propertyEventType: PropertyEventType, completion: @escaping (_ object: FireRecordType) -> Void)  -> DatabaseHandle
    static func observeFindFirst(when propertyEventType: PropertyEventType, _ toFirst: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void) -> DatabaseHandle
    static func observeFindLast(when propertyEventType: PropertyEventType, _ toLast: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)  -> DatabaseHandle
}

