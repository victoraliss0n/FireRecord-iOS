//
//  ViewController.swift
//  FireRecord
//
//  Created by victoralissont5@gmail.com on 08/09/2017.
//  Copyright (c) 2017 victoralissont5@gmail.com. All rights reserved.
//

import UIKit
import FireRecord

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User()
        user.name = "Correia"
        
        user.save { error in
            print(error ?? "=)")
        }
        user.destroy { error in
            print(error ?? "=)")
        }
        
        User.findFirst { user in
            print(user.name ?? "Does not contain name")
            user.name = "Alisson"
            user.update(completion: { error in
                print(error ?? "=)")
            })
        }
        
        User.all { users in
            let names = users.flatMap({$0.name})
            names.forEach({print($0)})
        }
    }
}
class User: FireRecord {
    public var name: String?
    init(name: String) { self.name = name }
    required public init() {}
}



