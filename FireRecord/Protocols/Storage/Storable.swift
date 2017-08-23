//
//  Storable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation

public protocol Storable: Uploadable {
    associatedtype Reference
    
    static var reference: Reference { get }
}
