//
//  ViewController.swift
//  FireRecord
//
//  Created by victoralissont5@gmail.com on 08/09/2017.
//  Copyright (c) 2017 victoralissont5@gmail.com. All rights reserved.
//

import UIKit
import FireRecord
import HandyJSON


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User()

        user.name = "Victor"
        user.photo = FirebaseImage(#imageLiteral(resourceName: "Image"))

        user.photo?.observeUploadProgress { progress in
            print("\(progress)% uploaded")
        }

        user.save { error in
            print(error?.localizedDescription ?? "No type of error")
        }

        User.findFirst(when: .anyChange) { user in
            user.name = "Mangueira"
            user.update(completion: { error in
                print(error?.localizedDescription ?? "No type of error")
            })
        }
        User.order(by: \User.name).find(when: .anyChange) { users in
            users.forEach { print($0.name ?? "Empty") }
        }
        User.order(by: \User.name)
            .start(atValue: "Alisson")
            .end(atValue: "Victor")
            .find(when: .anyChange) { users in
                users.forEach { print($0.name ?? "Empty") }
        }
        User.findLast(when: .anyChange) { user in
            print(user.name ?? "Empty")
        }
        User.findFirst(when: .propertyAdded) { user in
            print(user.name ?? "Empty")
        }
        User.order(by: \User.name).where(value: "Alisson").observeAll(when: .anyChange) { users in
            users.forEach { print($0.name ?? "Empty") }
        }
        User.order(by: \User.name).observeFindFirst(when: .anyChange) { user in
            print(user.name ?? "Empty")
        }
        User.observeAll(when: .propertyRemoved) { users in
            users.forEach { print($0.name ?? "Empty") }
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


