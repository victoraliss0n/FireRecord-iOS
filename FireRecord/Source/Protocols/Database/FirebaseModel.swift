//
//  FirebaseModel.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//
import Foundation
import FirebaseCommunity

public protocol FirebaseModel: ModelType where Reference == DatabaseReference  {
    func toJSON() -> [String: Any]
}
