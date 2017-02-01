//
//  TableViewController.swift
//  myFirstParseServer
//
//  Created by Victor Hong on 23/01/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {

    var foodArray: [PFObject]?
    var imageFile: PFFile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pfQuery = PFQuery(className: "Food")
        
        pfQuery.findObjectsInBackground { (foodItems, error) in
            
            self.foodArray = foodItems
            self.tableView.reloadData()
        }
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let foodArray = foodArray {
            return foodArray.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        if let foodArray = foodArray {
            cell.textLabel?.text = foodArray[indexPath.row].object(forKey: "name") as! String?
            
        } else {
            cell.textLabel?.text = "\(indexPath.row)"
        }
        
        return cell
    }
 
    @IBAction func createButton(_ sender: UIBarButtonItem) {
        
        /*let testObj = PFObject(className: "Food")
        testObj["name"] = "jerk chicken"
        testObj.saveInBackground()*/
//        let imageData = UIImagePNGRepresentation(#imageLiteral(resourceName: "women30"))
//        let file = PFFile(name: "women30.png", data: imageData!)
//        file?.saveInBackground(block: { (success, error) in
//            
//            if success {
//                let imageObj = PFObject(className: "Image")
//                imageObj["imageFile"]  = file
//                imageObj.saveInBackground(block: { (success, error) in
//                    
//                    if error == nil {
//                        print("data uploaded")
//                    } else {
//                        print(error ?? "")
//                    }
//                    
//                })
//            }
//        })
//        
//        tableView.reloadData()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
