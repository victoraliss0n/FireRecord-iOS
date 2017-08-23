import FirebaseCommunity

open class FireRecord: FirebaseModel {
    public var key: String?
    
    public static func configure() {
        FirebaseApp.configure()
    }
}
