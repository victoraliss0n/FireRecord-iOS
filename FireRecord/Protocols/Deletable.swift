//
//  Deletable.swift
//  FBSnapshotTestCase
//
//  Created by Victor Alisson on 11/08/17.
//

import Foundation

protocol Deletable {
    func destroy(completion: @escaping (_ error: Error?) -> Void)
}
