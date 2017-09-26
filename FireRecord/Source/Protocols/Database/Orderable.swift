//
//  Ordinable.swift
//  FireRecord
//
//  Created by Victor Alisson on 25/09/17.
//

import Foundation

public protocol Orderable {
    associatedtype FireRecordType
    static func order(byProperty property: String) -> FireRecordType.Type
    static func orderByValue() -> FireRecordType.Type
    static func start(atValue value: Any) -> FireRecordType.Type
    static func end(atValue value: Any) -> FireRecordType.Type
}
