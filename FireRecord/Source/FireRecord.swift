import FirebaseCommunity

open class FireRecord: FirebaseModel {    
    
    public var key: String?
    
    required public init() {}
    
    public static func configure() {
        FirebaseApp.configure()
    }
}



