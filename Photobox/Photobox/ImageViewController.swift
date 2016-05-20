//
//  ImageViewController.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIGestureRecognizerDelegate {

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
        self.view.multipleTouchEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeGestureRecognizer() {
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ImageViewController.recognizePinchGesture(_:)))
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ImageViewController.recognisePanGesture(_:)))
        imageView.addGestureRecognizer(pinchGesture)
        imageView.addGestureRecognizer(panGesture)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer,
                                    shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func recognizePinchGesture(sender: UIPinchGestureRecognizer) {
        // if let floatValue = imageView.layer.valueForKeyPath("transform.scale")?.floatValue where floatValue <= 2.0 {
        sender.delegate = self
        if let view = sender.view {
            UIView.animateWithDuration(0.07,animations: {
                view.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
                sender.scale = 1
                if sender.state == .Ended {
                    self.resetImageToProperViewingSizeIfExceeded(view.transform.a)
                }
            })
        }
        //}
    }

    func recognisePanGesture(sender: UIPanGestureRecognizer) {
        sender.delegate = self
        sender.maximumNumberOfTouches = 2
        let translation = sender.translationInView(self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    func resetImageToProperViewingSizeIfExceeded(a: CGFloat) {
        if a >= 2.16 {
            UIView.animateWithDuration(0.1, animations: {
                // self.imageView.transform = CGAffineTransformMakeScale(2.0, 2.0)
                self.imageView.transform = CGAffineTransform(a: 2.76, b: 0, c: 0, d: 2.76, tx: 0.0, ty: 0.0)
            })
        } else if a <= 1 {
            UIView.animateWithDuration(0.1, animations: {
                self.imageView.transform = CGAffineTransform(a: 1.0, b: 0, c: 0, d: 1.0, tx: 0.0, ty: 0.0)
            })
        }
    }
    
    //    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        print("touches ended")
    //    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
