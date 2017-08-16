//
//  Filterable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Filterable {
    static func filter(completion: @escaping (_ error: Error?) -> Void) ->
          [Self]
}
