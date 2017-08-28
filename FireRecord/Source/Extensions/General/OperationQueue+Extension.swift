//
//  OperationQueue+Extension.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 28/08/17.
//

import Foundation

public extension OperationQueue {
    func addOperations(_ ops: [Operation?], waitUntilFinished: Bool) {
        let operations = ops.flatMap{$0}
        
        self.addOperations(operations, waitUntilFinished: waitUntilFinished)
    }
}
