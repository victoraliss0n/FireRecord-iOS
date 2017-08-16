//
//  Updatable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 16/08/17.
//

import Foundation

public extension Updatable where Self: FirebaseModel {
    func update(completion: @escaping (_ error: Error?) -> Void) {
        Self.path.updateChildValues(self.toJSON()) { (error, reference) in
            completion(error)
        }
    }
}
