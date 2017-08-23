//
//  Uploadable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation
import FirebaseCommunity

protocol Uploadable {
    
    var data: Data? { get }
    
    func upload(with name: String)
}
