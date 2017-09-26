//
//  Writeable+Extension.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

public extension Writeable where Self: FirebaseModel {
    func save(completion: @escaping (_ error: Error?) -> Void) {
        let autoId = Self.autoId
        key = autoId
        guard var json = toJSONObject() else {return}
        
        uploadFiles { uploadedFiles in
            uploadedFiles.flatMap{$0}.forEach { file in
                json[file.name] = file.url
            }
            
            Self.classPath.child(autoId).setValue(json) { (error, reference) in
                completion(error)
            }
        }
    }
}
