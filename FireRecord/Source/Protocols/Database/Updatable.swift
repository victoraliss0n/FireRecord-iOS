//
//  Updatable.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

protocol Updatable {
    func update(completion: @escaping (_ error: Error?) -> Void)
}
