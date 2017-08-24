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
    
    public func upload(with name: String) {
        guard let data = data else {
            return
        }
        
        let uploadTask = Self.reference.child("images/decentPath").putData(data, metadata: StorageMetadata()) { (metadata, error) in
            
            if let error = error{
                print(error.localizedDescription as Any)
            }
            else {
                guard let urlStorage = metadata?.downloadURL()!.absoluteString else {
                    fatalError("couldn't generate the storage url")
                }
                let result = (name: name, path: urlStorage)
                //TODO: return the result
            }
            if let error = error {
                //TODO: Return an error
            }
        }
        uploadTask.resume()
    }
}
