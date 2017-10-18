//
//  RemovableObserver+FirebaseModel.swift
//  FireRecord
//
//  Created by Victor Alisson on 17/10/17.
//

import Foundation
import FirebaseCommunity

public extension RemovableObserver where Self: FirebaseModel {
    public static func removeObserver(withHandle handle: DatabaseHandle) {
        Self.classPath.removeObserver(withHandle: handle)
    }
    
   public static func removeAllObservers() {
        Self.classPath.removeAllObservers()
    }
}
