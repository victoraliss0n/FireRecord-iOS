//
//  Optional.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 18/10/17.
//

import Foundation

extension Optional: OptionalProtocol {
    func wrappedType() -> Any.Type {
        return Wrapped.self
    }
}
