//
//  Storator.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 24/08/17.
//

import Foundation

public protocol Storator {
    
    /**
         Upload all properties that should be saved in firebase storage
     */
    func uploadFiles(completion: @escaping ([NameAndUrl?]) -> Void)
}
