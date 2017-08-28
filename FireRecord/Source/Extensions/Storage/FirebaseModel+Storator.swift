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
        
        var uploadOperations = [Operation?]()
        
        for (name, value) in selfMirror.children {
            guard let name = name else { continue }
            print("\(name): \(type(of: value)) = '\(value)'")
            
            
            if let firebaseImage = value as? FirebaseImage {
                let imgUid = NSUUID().uuidString
                //let reference =  Self.storageReference.child("images/\(Self.className)/\(Self.autoId)/\(imgUid)")
                
                uploadOperations.append(firebaseImage.buildUploadOperation(fileName: name))
            }
            
        }
        
        let doneOperation = Operation()
        doneOperation.completionBlock = completion
        
        for operation in uploadOperations.flatMap({$0}) {
            doneOperation.addDependency(operation)
        }
        
        uploadOperations.append(doneOperation)
        
        OperationQueue.main.addOperations(uploadOperations, waitUntilFinished: false)
    }
}

extension OperationQueue {
    func addOperations(_ ops: [Operation?], waitUntilFinished: Bool) {
        let operations = ops.flatMap{$0}
        
        self.addOperations(operations, waitUntilFinished: waitUntilFinished)
    }
}
