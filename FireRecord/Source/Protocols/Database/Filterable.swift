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
}

