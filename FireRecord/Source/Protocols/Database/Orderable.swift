//
//  Orderable.swift
//  FireRecord
//
//  Created by Victor Alisson on 25/09/17.
//

import Foundation

public protocol Orderable {
    associatedtype FireRecordType
    static func order(by property: PartialKeyPath<FireRecordType>) -> FireRecordType.Type
    static func orderByValue() -> FireRecordType.Type
    static func orderByKey() -> FireRecordType.Type
}
