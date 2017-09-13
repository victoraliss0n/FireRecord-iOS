//
//  Updatable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public protocol Updatable: class {
    func update(completion: @escaping (_ error: Error?) -> Void)
}
