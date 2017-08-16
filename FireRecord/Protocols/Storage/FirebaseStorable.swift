//
//  FirebaseStorable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation

protocol FirebaseStorable: Uploadable {
    
}

extension FirebaseStorable {
    typealias Reference = StorageReference
    
    static var reference: StorageReference {
        return Storage.storage().reference()
    }
}
