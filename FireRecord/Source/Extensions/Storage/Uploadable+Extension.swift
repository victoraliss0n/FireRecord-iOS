//
//  Uploadable+Extension.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 25/08/17.
//

import Foundation

public extension Uploadable {
    func upload(fileName: String) {
        self.buildUploadOperation(fileName: fileName)?.start()
    }
}
