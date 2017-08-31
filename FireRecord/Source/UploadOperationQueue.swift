//
//  UploadOperationQueue.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 30/08/17.
//

import Foundation

class UploadOperationQueue {
    let operations: [UploadOperation]
    
    init(operations: [UploadOperation]) {
        self.operations = operations
    }
    
    func startUploads() {
        for operation in operations {
            operation.execute()
        }
    }
}
