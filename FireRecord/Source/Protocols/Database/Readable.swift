//
//  Readable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Readable: Filterable {
    static func all(completion: @escaping (_ objects: [FireRecordType]) -> Void)
    static func limit(value: Int8) -> FireRecordType.Type
    
}

