//
//  ModelType.swift
//  Created by Victor Alisson on 11/08/17.
//

import Foundation

protocol ModelType: ActiveRecord, Codable {
    associatedtype Reference
    static var reference: Self.Reference { get }
}

