//
//  Readable.swift
//  Created by Victor Alisson on 11/08/17.

import Foundation

protocol Readable: Filterable {
    static func all(completion: @escaping (_ error: Error?) -> Void) -> [Self]
}
