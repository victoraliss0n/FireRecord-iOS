//
//  Uploadable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation

public typealias ProgressObserver = (_ progress: Double) -> Void

public protocol Uploadable {
    
    var path: String? { get set }
    var data: Data? { get }
    
    func upload(fileName: String, path: String, onProgress: ProgressObserver?)
    func observeUploadProgress(onProgress: @escaping (_ progress: Double) -> Void)
}
