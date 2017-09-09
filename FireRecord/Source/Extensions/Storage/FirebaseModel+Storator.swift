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
                let uniqueId = NSUUID().uuidString
                let storagePath = "FireRecord/\(Self.className)/\(Self.autoId)/\(name)-\(uniqueId)"
                
                possibleUploads.append(firebaseImage.buildUploadOperation(fileName: name, path: storagePath))
            }
        }
        
        let uploads = possibleUploads.flatMap { $0 }
        
        let operationQueue = UploadOperationQueue(operations: uploads)
        operationQueue.startUploads { completion() }
    }
}
