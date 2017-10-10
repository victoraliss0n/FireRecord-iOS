//
//  FirebaseStorable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation
import FirebaseCommunity

public protocol FirebaseStorable: Storable  {
    
    var path: String? { get set }
}
