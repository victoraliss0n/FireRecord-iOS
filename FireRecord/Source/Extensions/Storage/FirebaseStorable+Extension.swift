//
//  FirebaseStorable+Extension.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 23/08/17.
//

import Foundation
import FirebaseCommunity

public extension FirebaseStorable {
    public static var reference: StorageReference {
        return Storage.storage().reference()
    }
}
