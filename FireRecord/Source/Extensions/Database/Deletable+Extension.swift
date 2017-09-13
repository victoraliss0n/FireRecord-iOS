//
//  Deletable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 16/08/17.
//

import Foundation

public extension Deletable where Self: FirebaseModel {
    func destroy(completion: @escaping (_ error: Error?) -> Void) {
        guard let key = self.key else {
            return
        }
        Self.classPath.child(key).removeValue { (error, reference) in
            completion(error)
        }
    }
}
