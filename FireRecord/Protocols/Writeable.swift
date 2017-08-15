//
//  Writeable.swift
//  Created by Victor Alisson on 11/08/17.
//

import Foundation

protocol Writeable {
    func save(completion: @escaping (_ error: Error?) -> Void)
}
