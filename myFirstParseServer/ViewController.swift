//
//  ViewController.swift
//  myFirstParseServer
//
//  Created by Victor Hong on 23/01/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let testObj = PFObject(className: "testObj")
//        testObj["foo"] = "bar"
//        testObj.saveInBackground()
        let pfImageQuery = PFQuery(className: "Image")
        
        pfImageQuery.findObjectsInBackground { (pfObjects, error) in
            
            if let file = pfObjects?[0].object(forKey: "imageFile") as? PFFile {
                file.getDataInBackground(block: { (imageData, error) in
                    if error == nil {
                        self.imageView.image = UIImage(data: imageData!)
                    } else {
                        print(error ?? "")
                    }
                    
                })
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

