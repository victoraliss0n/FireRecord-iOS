//
//  ReadableRealTime.swift
//  FireRecord
//
//  Created by Victor Alisson on 28/09/17.
//

import Foundation
import FirebaseCommunity

public protocol ReadableInRealTime: Limitable, Orderable, FilterableInRealTime {
    
    @discardableResult static func observeAll(completion: @escaping (_ objects: [FireRecordType]) -> Void) -> DatabaseHandle
    static func observeFind(completion: @escaping (_ objects: [FireRecordType]) -> Void) -> DatabaseHandle
    
}
