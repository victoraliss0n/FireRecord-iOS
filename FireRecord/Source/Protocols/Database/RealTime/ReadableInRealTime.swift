//
//  ReadableRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public protocol ReadableInRealTime: Limitable, Orderable, FilterableInRealTime {
    
    static func observeAll(when propertyEventType: PropertyEventType, completion: @escaping (_ objects: [FireRecordType]) -> Void) -> DatabaseHandle
    static func observeFind(when propertyEventType: PropertyEventType, completion: @escaping (_ objects: [FireRecordType]) -> Void) -> DatabaseHandle
    
}
