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
}
