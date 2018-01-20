//
//  FirebaseImage.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation

open class FirebaseImage: FirebaseStorable {
    
    public init(_ image: UIImage) {
        super.init()
        self.data = UIImagePNGRepresentation(image)
    }
    
    public required init() {
    }
}
