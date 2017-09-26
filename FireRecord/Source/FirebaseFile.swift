//
//  FirebaseFile.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation
import HandyJSON

open class FirebaseFile: FirebaseStorable {
    
    public var data: Data?
    
    public required init() {}
    
    public func mapping(mapper: HelpingMapper) {
        mapper >>> data
    }
}
