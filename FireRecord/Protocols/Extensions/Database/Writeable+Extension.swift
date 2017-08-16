//
//  Writeable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public extension Writeable where Self: FirebaseModel {
    
    func save(completion: @escaping (_ error: Error?) -> Void) {
        Self.path.setValue(self.toJSON()) { (error, reference) in
            completion(error)
        }
    }
}
