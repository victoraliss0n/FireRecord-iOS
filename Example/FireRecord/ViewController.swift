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

class Pedim: FireRecord {
    let photo: FirebaseImage
    let anotherPhoto: FirebaseImage
    
    init(photo: Data, photo2: Data) {
        self.photo = FirebaseImage()
        self.photo.data = photo
        
        self.anotherPhoto = FirebaseImage()
        self.anotherPhoto.data = photo2
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FireRecord.configure()
        let file = FirebaseImage()
        file.data = UIImagePNGRepresentation(#imageLiteral(resourceName: "Image"))
        
        //file.upload(fileName: "a_simple_name")
        
        let pedim = Pedim(photo: UIImagePNGRepresentation(#imageLiteral(resourceName: "Image"))!, photo2: UIImagePNGRepresentation(#imageLiteral(resourceName: "Image"))!)
        
        pedim.uploadFiles {
            print("pickle rickkkkk")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
