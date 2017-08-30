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
        user.name = "Alisson"
        
        user.save { error in
            print(error ?? "=)")
        }
        
        User.all { users in
            let names = users.flatMap({$0.name})
            names.forEach({print($0)})
        }
//        let file = FirebaseFile()
//        file.data = UIImagePNGRepresentation(#imageLiteral(resourceName: "Image")) as? Data
//        file.upload(with: "my_name")
    }
}
class User: FireRecord {
    var name: String?
    
    init(name: String) { self.name = name }
    required init() {}
}

