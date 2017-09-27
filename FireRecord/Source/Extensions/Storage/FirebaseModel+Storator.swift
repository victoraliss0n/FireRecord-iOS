//
//  FirebaseDataModel+Storator.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 24/08/17.
//

import Foundation
import FirebaseCommunity
import HandyJSON

public extension Storator where Self: FirebaseModel {
    
    func uploadFiles(completion: @escaping ([NameAndUrl?]) -> Void) {
        let selfMirror = Mirror(reflecting: self)
        
        var possibleUploads = [UploadOperation?]()
        
        for (name, value) in selfMirror.children {
            guard let name = name else { continue }
            
            if let firebaseImage = value as? FirebaseImage {
                let uniqueId = NSUUID().uuidString
                let storagePath = "FireRecord/\(Self.className)/\(Self.autoId)/\(name)-\(uniqueId)"
                
                possibleUploads.append(firebaseImage.buildUploadOperation(fileName: name, path: storagePath))
            }
        }
        
        let uploads = possibleUploads.flatMap { $0 }
        
        let operationQueue = UploadOperationQueue(operations: uploads)
        operationQueue.startUploads { results in
            completion(results)
        }
    }
    
    internal mutating func deserializeStorablePaths(snapshot: DataSnapshot) {
        let selfMirror = Mirror(reflecting: self)
        
        let modelDictionary = snapshot.value as? NSDictionary
        var storables = [String: Any]()
        
        for (name, propertyValue) in selfMirror.children {
            guard let name = name else { continue }
            
            if type(of: propertyValue) is FirebaseImage?.Type {
                let firebaseImage = FirebaseImage()
                firebaseImage.path = modelDictionary?[name] as? String
                storables[name] = firebaseImage
            }
        }
        
        JSONDeserializer.update(object: &self, from: storables)
    }
}
