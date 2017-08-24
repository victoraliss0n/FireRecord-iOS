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
        FireRecord.configure()
        
        let file = FirebaseFile()
        file.data = UIImagePNGRepresentation(#imageLiteral(resourceName: "Image")) as? Data
        
        file.upload(with: "mind_philosophy")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
