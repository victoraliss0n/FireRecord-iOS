# FireRecord

[![Version](https://img.shields.io/cocoapods/v/FireRecord.svg?style=flat)](http://cocoapods.org/pods/FireRecord)
[![License](https://img.shields.io/cocoapods/l/FireRecord.svg?style=flat)](http://cocoapods.org/pods/FireRecord)
[![Platform](https://img.shields.io/cocoapods/p/FireRecord.svg?style=flat)](http://cocoapods.org/pods/FireRecord)
<a href="https://swift.org">
<img src="http://img.shields.io/badge/swift-4.0-brightgreen.svg" alt="Swift 4.0">
</a>

FireRecord is a framework written in swift which brings the ActiveRecord architecture as a wrapper to Firebase SDK on iOS. The main idea is to make iOS development with Firebase ([Firestore](https://firebase.google.com/docs/firestore) and [Storage](https://firebase.google.com/docs/storage)) still more productive with the well-known [Active Record Pattern](http://guides.rubyonrails.org/active_record_basics.html) from [Rails community](http://rubyonrails.org/community).

## Example

### Inherit from FireRecord

```swift
class User: FireRecord {
  var age: Int?
  var name: String?
  var photo: FirebaseImage?
}
```

### Init your model
```swift
let user = User()
user.name = "Jhon"
user.photo = FirebaseImage(UIImage())
```

### Save
```swift
user.save { error in print(error ?? errorMessage) }
```

### Read
```swift
User.all { users in
  users.flatMap{ $0.name }.forEach{ print($0) }
}

User.findFirst { user in
  print(user.name ?? "First users doesn't have name")
}

User.findLast { user in
  print(user.name ?? "Last users doesn't have name")
}

User.findFirst(3) { users in
  users.forEach { user in print(user.name ?? " User doesn't have name")}
}

User.findLast(3) { users in
  users.forEach { user in print(user.name ?? " User doesn't have name")}
}
```

### Update
```swift
user.name = "My new Name"
user.update { error in print(error ?? errorMessage) }
```

### Delete
```swift
user.destroy { error in print(error ?? errorMessage)}
```

### Query
```swift
User.order(byProperty: "name").where(value: "Alisson").find { users in
  users.flatMap{ $0.name }.forEach{ print($0) }                          //print all names
}

Professional.order(byProperty: "phone").where(value: "98984933").find { professionals in
  professionals.flatMap{ $0.phone }.forEach{ print($0) }                //print all phones
}

User.order(byProperty: "name").findLast { user in
  print(user.name ?? "Property not present")
}

User.order(byProperty: "name").findLast(3) { users in
  print(users.count)
}

User.order(byProperty: "name").findFirst { user in
  print(user.name ?? "Property not present")
}
```

## Features

- [x] Basic CRUD functionality with Realtime Database
- [x] Map queries from Realtime Database
- [x] Manage image/file properties (send/retrieve from Storage)
- [x] Add realtime Capabilities
- [ ] Add relationship mapping
- [ ] Add offline capabilities

PS: We are going to chage [Realtime Database](https://firebase.google.com/docs/database) for [Cloud Firestore](https://firebase.google.com/docs/firestore) soon. Stay Tunned!

[See open issues for more details](https://github.com/victoraliss0n/FireRecord/issues)

## Requirements

[Add Firebase to your project](https://firebase.google.com/docs/ios/setup)

## Installation

FireRecord is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FireRecord"
```

## Authors

* Victor Alisson, victoralissont5@gmail.com
* David Sanford,  dsanfordseu@gmail.com

## License

FireRecord is available under the MIT license. See the LICENSE file for more info.
