//
//  ImageViewController.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UINavigationItem!
    
    
    // MARK: Properties
    var image:Image?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = image {
            imageTitle.title = image.name
            imageView.image = image.image
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
