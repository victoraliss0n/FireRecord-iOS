//
//  ReadableRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation

public protocol ReadableInRealTime: Limitable, Orderable {
    
    static func observeAll(completion: @escaping (_ objects: [FireRecordType]) -> Void)
    static func observeFind(completion: @escaping (_ objects: [FireRecordType]) -> Void)
    
}
