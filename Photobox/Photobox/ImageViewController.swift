//
//  ImageViewController.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    // MARK: Properties
    var image: Image?
    
    
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = Image(name: "poster", image: UIImage(named:"1"))
        if let image = image{
            imageView.image = image.image
            navigationItem.title = image.name
        }
        
        self.initializeGestureRecognizer()

        // shouldrecognisesemultanously
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeGestureRecognizer() {
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ImageViewController.recognizePinchGesture(_:)))
        imageView.addGestureRecognizer(pinchGesture)
        
    }
    
    func recognizePinchGesture(sender: UIPinchGestureRecognizer) {
        
        if let floatValue = imageView.layer.valueForKeyPath("transform.scale")?.floatValue where floatValue <= 2.0 {
            sender.view?.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
            sender.scale = 1
            print("proper size: \(imageView.layer.valueForKeyPath("transform.scale")?.floatValue)")
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.imageView.transform = CGAffineTransformMakeScale(2.0, 2.0)
            })
            print("oversized: \(imageView.layer.valueForKeyPath("transform.scale")?.floatValue)")
        }
    
//        sender.state == .Ended
        
        
//        print(imageView.bounds)
//        print(imageView.layer.valueForKeyPath("transform.scale")?.floatValue)
        
        
//        if (imageView.bounds.height < 1000) {
//            sender.view?.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
//        }
        
//        sender.view?.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
        
//        print(sender.view?.transform)
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
