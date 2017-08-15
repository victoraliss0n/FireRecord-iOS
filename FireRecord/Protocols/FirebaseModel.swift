//  FirebaseModel.swift
//  Created by Victor Alisson on 11/08/17.
//

import Foundation

protocol FirebaseModel: ModelType {
    var key: String? { get set }
    func toJSONObject() -> [String: AnyObject]
}


