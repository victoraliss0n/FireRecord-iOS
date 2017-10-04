//
//  Readable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Readable: Filterable, Orderable, Limitable {
    static func all(completion: @escaping (_ objects: [FireRecordType]) -> Void)
    static func find(completion: @escaping (_ objects: [FireRecordType]) -> Void)
    func findByKey(completion: @escaping (_ object: FireRecordType) -> Void)
    static func find(byKey key: String, completion: @escaping (_ object: FireRecordType) -> Void)

}

