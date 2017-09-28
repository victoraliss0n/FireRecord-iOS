# FireRecord

[![CI Status](http://img.shields.io/travis/victoralissont5@gmail.com/FireRecord.svg?style=flat)](https://travis-ci.org/victoralissont5@gmail.com/FireRecord)
[![Version](https://img.shields.io/cocoapods/v/FireRecord.svg?style=flat)](http://cocoapods.org/pods/FireRecord)
[![License](https://img.shields.io/cocoapods/l/FireRecord.svg?style=flat)](http://cocoapods.org/pods/FireRecord)
[![Platform](https://img.shields.io/cocoapods/p/FireRecord.svg?style=flat)](http://cocoapods.org/pods/FireRecord)

FireRecord is a framework written in swift which brings the ActiveRecord architecture as a wrapper to Firebase SDK on iOS

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


## Requirements

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
