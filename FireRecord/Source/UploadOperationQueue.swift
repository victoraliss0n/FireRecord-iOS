//
//  UploadOperationQueue.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 30/08/17.
//

import Foundation

class UploadOperationQueue {
    let operations: [UploadOperation]
    private var currentOperationIndex = 0
    
    var completion: (() -> Void)?
    
    init(operations: [UploadOperation]) {
        self.operations = operations
    }
    
    func startUploads(completion: @escaping () -> Void) {
        self.completion = completion
        nextUpload()
    }
    
    private func nextUpload() {
        if currentOperationIndex >= operations.count {
            self.completion?()
            return
        }
        
        let currentOperation = operations[currentOperationIndex]
        currentOperation.completion = { result in
            self.currentOperationIndex += 1
            self.nextUpload()
        }
        currentOperation.execute()
        
    }
    
}
