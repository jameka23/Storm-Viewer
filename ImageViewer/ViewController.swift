//
//  ViewController.swift
//  ImageViewer
//
//  Created by Jameka Echols on 8/15/18.
//  Copyright © 2018 Jameka Echols. All rights reserved.
//

import UIKit  // file to reference the iOS user interface kit

class ViewController: UITableViewController {
    
    var pictures = [String]() //array of file names (pictures), () =create now!
    
    
    override func viewDidLoad() { // override means to change Apple's default behavior
        super.viewDidLoad() // super tells Apple to run UIViewController before mine
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default //file manager constant to use the filesystem
        let path = Bundle.main.resourcePath! // show me where I can find my images I added to the file
        let items = try! fm.contentsOfDirectory(atPath: path) // an array of the file names that were found in the
        
        for item in items {
            if item.hasPrefix("IMG") {
                // the picture should load
                pictures.append(item) //load the picture file names to the array
            }
        }
        print(pictures)
    }
    
    // override means to change the default behaviors
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count // gives the number of items in the array should be 14
        // also tells the tableView how many rows we want and we want them in a section such as in Contacts app
    }
    
    // specify what each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

