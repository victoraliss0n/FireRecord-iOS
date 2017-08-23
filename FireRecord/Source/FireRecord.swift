import FirebaseCommunity

open class FireRecord: FirebaseModel {
    var key: String?
    
    public static func configure() {
        FirebaseApp.configure()
    }
}
