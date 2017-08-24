//
//  FirebaseModel.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//
import Foundation
import FirebaseCommunity

protocol FirebaseModel: ModelType where Reference == DatabaseReference  {
    var key: String? { get set }
    init()
    func toJSON() -> [String: Any]
}
