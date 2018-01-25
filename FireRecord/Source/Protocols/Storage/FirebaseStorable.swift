//
//  FirebaseStorable.swift
//  FirebaseCommunity
//
//  Created by David Sanford on 15/08/17.
//

import Foundation
import FirebaseCommunity
import HandyJSON

open class FirebaseStorable: Storable  {
    internal var uploadFinishedCallback: UploadFinishedCallback?
    
    var onProgress: ProgressObserver?
    
    public var path: String?
    public var data: Data?
    
    public required init() {}
    
    public func mapping(mapper: HelpingMapper) {
        mapper >>> data
    }
}
