//
//  ViewController.swift
//  FireRecord
//
//  Created by victoralissont5@gmail.com on 08/09/2017.
//  Copyright (c) 2017 victoralissont5@gmail.com. All rights reserved.
//

import UIKit
import FireRecord
import FirebaseCommunity
import HandyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User()
        
        user.name = "Victor"
        user.photo = FirebaseImage(#imageLiteral(resourceName: "Image"))
        
        User.findFirst { user in
            print(user.name ?? "Empty")
        }
        User.observeFindFirst { user in
            print(user.name ?? "Empty")
        }
        User.all { users in
            users.forEach {print($0.name ?? "Empty")}
        }
        User.observeAll { users in
            users.forEach {print($0.name ?? "Empty")}
        }
        User.findLast(2) { users in
            users.forEach { print($0.name ?? "Empty") }
        }
        User.observeFindLast(2) { users in
            users.forEach { print($0.name ?? "Empty") }
        }
        
        let errorMessage = "Does not contain error"

        user.save { error in print(error ?? errorMessage)}
        user.destroy { error in print(error ?? errorMessage)}

        User.findFirst { user in
            user.name = "Alisson"
            user.update(completion: { error in
                print(error ?? "")
            })
        }
        User.findLast { user in
            print(user.name ?? "Does not contain name")
        }

        User.order(byProperty: "name").where(value: "alisson3").find { users in
            users.forEach {print($0.name ?? "Property not present")}
        }
        Professional.order(byProperty: "phone").where(value: "98984933").find { professionals in
            professionals.forEach {print($0.phone ?? "Property not present")}
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
        User.order(byProperty: "name").findFirst(3) { users in
            print(users.count)
        }
        User.orderByValue().findFirst(1) { users in
            print(users.count)
        }
        User.order(byProperty: "name")
            .start(atValue: "Alisson")
            .end(atValue: "Victor")
            .observeFind { users in
                users.forEach { print($0.name ?? "Empty Property") }
        }
    }
}
class User: FireRecord {
    
    var name: String?
    var photo: FirebaseImage?
    
    init(name: String) { self.name = name }
    required public init() {}
}

class Professional: FireRecord {
    var name: String?
    var phone: String?
}


