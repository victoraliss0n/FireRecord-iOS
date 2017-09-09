//
//  UploadOperation.swift
//  FireRecord
//
//  Created by David Sanford on 25/08/17.
//

import Foundation
import FirebaseCommunity

public class UploadOperation {
    let data: Data
    let fileName: String
    var completion: (() -> Void)?
    
    init(data: Data, name: String) {
        self.data = data
        self.fileName = name
    }
 
    func execute() {
        let uploadTask = Storage.storage().reference().child("images/\(fileName)").putData(data, metadata: StorageMetadata()) { (metadata, error) in
            
            if let error = error{
                print(error.localizedDescription as Any)
            }
            else {
                guard let urlStorage = metadata?.downloadURL()!.absoluteString else {
                    self.completion?()
                    fatalError("couldn't generate the storage url")
                }
                let result = (name: self.fileName, path: urlStorage)
                print("uploaded")
                self.completion?()
                //TODO: return the result
            }
            if let error = error {
                print("error")
                self.completion?()
                //TODO: Return an error
            }
        }
        uploadTask.resume()
    }
}
