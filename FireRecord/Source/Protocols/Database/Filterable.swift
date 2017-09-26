//
//  Filterable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Filterable {
    associatedtype FireRecordType
    
    static func findFirst(completion: @escaping (_ object: FireRecordType) -> Void)
    static func findLast(completion: @escaping (_ object: FireRecordType) -> Void)
    static func findFirst(_ toFirst: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)
    static func findLast(_ toLast: UInt, completion: @escaping (_ object: [FireRecordType]) -> Void)
}

