//
//  ModelType.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol ModelType: ActiveRecord, Serializable {
    associatedtype Reference
    static var reference: Self.Reference { get }
}
