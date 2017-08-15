//
//  FirebaseModel.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//

import Foundation

import Foundation

protocol FirebaseModel: ModelType {
    var key: String? { get set }
    func toJSONObject() -> [String: AnyObject]
}
