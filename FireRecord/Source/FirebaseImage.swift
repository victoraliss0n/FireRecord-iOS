//
//  FirebaseImage.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation
import HandyJSON

open class FirebaseImage: FirebaseStorable {
    
    public var data: Data?
    
    public required init() {}
    
    public init(_ image: UIImage) {
        self.data = UIImagePNGRepresentation(image)
    }
    
    public func mapping(mapper: HelpingMapper) {
        mapper >>> data
    }
}
