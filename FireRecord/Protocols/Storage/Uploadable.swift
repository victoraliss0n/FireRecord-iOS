//
//  Uploadable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation
import FirebaseCommunity

public protocol Uploadable {
    
    var data: Data? { get }
    
    func upload(with name: String)
}
