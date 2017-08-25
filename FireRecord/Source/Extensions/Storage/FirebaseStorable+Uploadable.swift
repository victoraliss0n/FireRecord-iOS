//
//  FirebaseStorable+Uploadable.swift
//  FireRecord
//
//  Created by David Sanford on 25/08/17.
//

import Foundation

extension Uploadable where Self: FirebaseStorable {
    public func buildUploadOperation(fileName: String) -> Operation? {
        guard let data = data else {
            return nil
        }
        
        return UploadOperation(data: data, name: fileName)
    }
}
