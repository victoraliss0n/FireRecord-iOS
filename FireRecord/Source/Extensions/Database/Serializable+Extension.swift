//
//  Serializable+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 22/10/17.
//

import Foundation

public extension Serializable {
    typealias JSON = [String: Any]
    
    func toJSONObject() -> JSON? {
        return toJSON()
    }
}
