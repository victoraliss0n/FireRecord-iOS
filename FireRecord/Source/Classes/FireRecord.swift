import FirebaseCommunity

open class FireRecord: FirebaseModel {
    var key: String?
    
    required public init() {}
    
    public static func configure() {
        FirebaseApp.configure()
    }
}



