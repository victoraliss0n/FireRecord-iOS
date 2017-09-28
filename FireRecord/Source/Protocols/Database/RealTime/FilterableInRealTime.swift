//
//  FilterableInRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation

public protocol FilterableInRealTime {
    associatedtype FireRecordType
    
    static func observeFindFirst(completion: @escaping (_ object: FireRecordType) -> Void)
    static func observeFindLast(completion: @escaping (_ object: FireRecordType) -> Void)
    static func observeFindFirst(_ toFirst: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)
    static func observeFindLast(_ toLast: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)
}

