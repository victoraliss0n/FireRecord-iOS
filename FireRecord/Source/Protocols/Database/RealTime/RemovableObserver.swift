//
//  RemovableObserver.swift
//  FireRecord
//
//  Created by Victor Alisson on 17/10/17.
//

import Foundation
import FirebaseCommunity

public protocol RemovableObserver: class {
    static func removeObserver(withHandle handle: DatabaseHandle)
    static func removeAllObservers()


}
