//
//  Updatable.swift
//  FBSnapshotTestCase
//
//  Created by Victor Alisson on 11/08/17.
//

import Foundation

protocol Updatable {
    func update(completion: @escaping (_ error: Error?) -> Void)
}
