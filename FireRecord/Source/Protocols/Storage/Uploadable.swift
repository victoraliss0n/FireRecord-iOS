//
//  Uploadable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation

public protocol Uploadable {
    
    var data: Data? { get }
    
    func buildUploadOperation(fileName: String) -> Operation?
    func upload(fileName: String)
}
