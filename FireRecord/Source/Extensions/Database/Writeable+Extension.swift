//
//  Writeable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

extension Writeable where Self: FirebaseModel {
    func save(completion: @escaping (_ error: Error?) -> Void) {
        Self.path.child(Self.autoId).setValue(self.toJSON()) { (error, reference) in
            completion(error)
        }
    }
}
