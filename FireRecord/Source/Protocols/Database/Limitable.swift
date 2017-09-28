//
//  Limitable.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation

public protocol Limitable {
    associatedtype FireRecordType
    
    static func `where`(value: Any) -> FireRecordType.Type
}
