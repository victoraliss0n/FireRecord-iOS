//
//  FirebaseStorable+Uploadable.swift
//  FireRecord
//
//  Created by David Sanford on 25/08/17.
//

import Foundation

extension Uploadable where Self: FirebaseStorable {
    public func buildUploadOperation(fileName: String, path: String, onProgress: ProgressObserver? = nil) -> UploadOperation? {
        guard let data = data else {
            return nil
        }
        
        let reference =  Self.reference.child(path)
        return UploadOperation(data: data, name: fileName, reference: reference)
    }
    
    public func upload(fileName: String, path: String, onProgress: ProgressObserver? = nil) {
        buildUploadOperation(fileName: fileName, path: path)?.execute()
    }
}
