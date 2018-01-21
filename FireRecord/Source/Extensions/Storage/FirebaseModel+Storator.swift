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
            
            //This aditional cast to Anyobject is needed because of this swift bug: https://bugs.swift.org/browse/SR-3871
            if let firebaseStorable = value as? AnyObject as? FirebaseStorable {
                let uniqueId = NSUUID().uuidString
                let storagePath = "FireRecord/\(Self.className)/\(Self.autoId)/\(name)-\(uniqueId)"
                
                possibleUploads.append(firebaseStorable.buildUploadOperation(fileName: name, path: storagePath, onProgress: firebaseStorable.onProgress))
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
            
            // Cast to OptionalProtocol because swift(4.0) still can't infer that FirebaseImage?.self is FirebaseStorable?.Type.
            if let optionalProperty = propertyValue as? OptionalProtocol,
                let propertyType = optionalProperty.wrappedType() as? FirebaseStorable.Type {
                
                var firebaseStorable = propertyType.init()
                firebaseStorable.path = modelDictionary?[name] as? String
                storables[name] = firebaseStorable
            }
        }
        
        JSONDeserializer.update(object: &self, from: storables)
    }
}
