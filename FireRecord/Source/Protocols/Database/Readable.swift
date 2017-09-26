//
//  Readable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Readable: Filterable, Orderable {
    static func all(completion: @escaping (_ objects: [FireRecordType]) -> Void)
    static func `where`(value: Any) -> FireRecordType.Type
    static func find(completion: @escaping (_ objects: [FireRecordType]) -> Void)
}

