import FirebaseCommunity
import HandyJSON

open class FireRecord: FirebaseModel {
    public var key: String?
    public static var firebaseReference: DatabaseReference?
    
    required public init() {}
    
    public func mapping(mapper: HelpingMapper) {
        mapper >>> key
        mapper >>> FireRecord.firebaseReference
    }
}



