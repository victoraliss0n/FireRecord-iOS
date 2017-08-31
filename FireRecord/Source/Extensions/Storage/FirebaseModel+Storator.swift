//
//  FirebaseDataModel+Storator.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 24/08/17.
//

import Foundation

public extension Storator where Self: FirebaseModel {
    
    func uploadFiles(completion: @escaping () -> Void) {
        let selfMirror = Mirror(reflecting: self)
        
        var possibleUploads = [UploadOperation?]()
        
        for (name, value) in selfMirror.children {
            guard let name = name else { continue }
            print("\(name): \(type(of: value)) = '\(value)'")
            
            
            if let firebaseImage = value as? FirebaseImage {
                let imgUid = NSUUID().uuidString
                //let reference =  Self.storageReference.child("images/\(Self.className)/\(Self.autoId)/\(imgUid)")
                possibleUploads.append(firebaseImage.buildUploadOperation(fileName: name))
            }
        }
        
        let uploads = possibleUploads.flatMap { $0 }
        
        let operationQueue = UploadOperationQueue(operations: uploads)
        operationQueue.startUploads()
    }
}
