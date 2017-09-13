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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User()
        user.name = "Victor"
        
        user.save { error in print(error ?? "=)")}
        user.destroy { error in print(error ?? "=)")}

        User.findFirst { user in
            user.name = "Alisson"
            user.update(completion: { error in
                print(error ?? "=)")
            })
        }
        User.findFirst(3) { users in
            users.forEach({print($0.name ?? "Does not contain name")})
        }
        //
        User.findLast(3) { users in
            users.forEach({print($0.name ?? "Does not contain name")})
        }
        User.findLast { user in
            print(user.name ?? "Does not contain name")
        }
        User.all { users in
            let names = users.flatMap({$0.name})
            names.forEach({print($0)})
        }
    }
}
class User: FireRecord {
    
    public var name: String?
    var photo: FirebaseImage?
    var anotherPhoto: FirebaseImage?
    
    init(name: String) { self.name = name }
    required public init() {}
}


