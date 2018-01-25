//
//  UploadOperation.swift
//  FireRecord
//
//  Created by David Sanford on 25/08/17.
//

import Foundation
import FirebaseCommunity

public typealias NameAndUrl = (name: String, url: String)

public class UploadOperation {
    let data: Data
    let fileName: String
    let reference: StorageReference
    var completion: ((_ result: NameAndUrl?) -> Void)?
    var progressObserver: ProgressObserver?
    
    init(data: Data, name: String, reference: StorageReference, progressObserver: ProgressObserver? = nil) {
        self.data = data
        self.fileName = name
        self.reference = reference
        self.progressObserver = progressObserver
    }
 
    func execute() {
        let uploadTask = reference.putData(data, metadata: StorageMetadata()) { (metadata, error) in
            
            if let error = error{
                print(error.localizedDescription as Any)
            }
            else {
                guard let urlStorage = metadata?.downloadURL()!.absoluteString else {
                    self.completion?(nil)
                    fatalError("couldn't generate the storage url")
                }
                let result = (name: self.fileName, url: urlStorage)
                print("uploaded")
                self.completion?(result)
                //TODO: return the result
            }
            if let _ = error {
                print("error")
                self.completion?(nil)
                //TODO: Return an error
            }
        }
        
        if let progressObserver = progressObserver {
            uploadTask.observe(.progress) { snapshot in
                guard let completedProgress = snapshot.progress?.completedUnitCount,
                      let totalProgress = snapshot.progress?.totalUnitCount else {
                    fatalError("Could not calculate current percentage progress")
                }
                
                let percentComplete = 100.0 * Double(completedProgress) / Double(totalProgress)
                
                progressObserver(percentComplete)
            }
        }
        
        uploadTask.resume()
    }
}
