//
//  ModelType+Extension.swift
//  FireRecord
//
//  Created by Victor Alisson on 22/10/17.
//

import Foundation

public extension ModelType {
    public static var className: String {
        return String(describing: self)
    }
}

