import FirebaseCommunity
import HandyJSON

@objcMembers
open class FireRecord: FirebaseModel {
    
    public var key: String?
    public static var fireRecordReference: DatabaseReference?
    public static var fireRecordQuery: DatabaseQuery?

    required public init() {}
    
    public func mapping(mapper: HelpingMapper) {
        mapper >>> key
        mapper >>> FireRecord.fireRecordReference
        mapper >>> FireRecord.fireRecordQuery
    }
}


