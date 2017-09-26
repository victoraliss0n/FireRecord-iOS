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
        
//        let errorMessage = "Does not contain error"
//
//        user.save { error in print(error ?? errorMessage)}
//        user.destroy { error in print(error ?? errorMessage)}

//        User.findFirst { user in
//            user.name = "Alisson"
//            user.update(completion: { error in
//                print(error ?? "=)")
//            })
//        }
//        User.findFirst(3) { users in
//            users.forEach({print($0.name ?? "Does not contain name")})
//        }
//        //
//        User.findLast(3) { users in
//            users.forEach({print($0.name ?? "Does not contain name")})
//        }
//        User.findLast { user in
//            print(user.name ?? "Does not contain name")
//        }
//        User.all { users in
//            let names = users.flatMap({$0.name})
//            names.forEach({print($0)})
//        }
        
        User.order(byProperty: "name").where(value: "Alisson").find { users in
            users.forEach {print($0.name ?? "Property not present")}
        }
        Professional.order(byProperty: "phone").where(value: "98984933").find { professionals in
            professionals.forEach {print($0.phone ?? "Property not present")}
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


