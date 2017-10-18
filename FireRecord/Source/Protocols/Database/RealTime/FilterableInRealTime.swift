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
    
    static func observeFindFirst(completion: @escaping (_ object: FireRecordType) -> Void) -> DatabaseHandle
    static func observeFindLast(completion: @escaping (_ object: FireRecordType) -> Void)  -> DatabaseHandle
    static func observeFindFirst(_ toFirst: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void) -> DatabaseHandle
    static func observeFindLast(_ toLast: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)  -> DatabaseHandle
}

