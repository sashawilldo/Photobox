//
//  ImageViewController.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var image: Image?
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pinch = UIPinchGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        image = Image(name: "poster", image: UIImage(named:"1"))
        if let image = image{
            imageView.image = image.image
            navigationItem.title = image.name
        }
        
        self.pinch = UIPinchGestureRecognizer(target: self, action: #selector(ImageViewController.Pinch(_:)))
        self.imageView.addGestureRecognizer(self.pinch)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Pinch(s: UIPinchGestureRecognizer) {
//        self.imageView.transform = CGAffineTransformMakeScale(s.scale, s.scale)
        
        
        var scale: CGFloat = pinch.scale
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, scale, scale)
        pinch.scale = 1.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
