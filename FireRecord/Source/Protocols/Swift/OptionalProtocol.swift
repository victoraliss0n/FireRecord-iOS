//
//  OptionalProtocol.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 18/10/17.
//

import Foundation

/// Needed to know witch type is wrapped in a Optional and also to know when a property is an optional
/// by testing the conformance to this protocol instead of deal with the Optional Enum.
protocol OptionalProtocol {
    func wrappedType() -> Any.Type
}
