//
//  FirebaseModel.swift
//  FirebaseCommunity
//
//  Created by Victor Alisson on 15/08/17.
//
import Foundation
import FirebaseCommunity

public protocol FirebaseModel: ModelType where Reference == DatabaseReference  {
    var key: String? { get set }
    static var firebaseReference: DatabaseReference? {get set}
    init()
    func toJSON() -> [String: Any]
}
