//
//  ViewController.swift
//  ImageViewer
//
//  Created by Jameka Echols on 8/15/18.
//  Copyright © 2018 Jameka Echols. All rights reserved.
//

import UIKit  // file to reference the iOS user interface kit

class ViewController: UIViewController {
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

