//
//  Deletable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 16/08/17.
//

import Foundation

public extension Deletable where Self: FirebaseModel {
    func destroy(completion: @escaping (_ error: Error?) -> Void) {
        Self.path.removeValue { (error, reference) in
            completion(error)
        }
    }
}
