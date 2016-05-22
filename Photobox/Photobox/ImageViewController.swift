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
    var isHidden:Bool = false
    
    
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = Image(name: "poster", image: UIImage(named:"1"))
        if let image = image{
            imageView.image = image.image
    
            let aspectRatio:CGFloat = (image.image?.size.height)! / (image.image?.size.width)!
            imageView.frame.size = CGSize(width: view.frame.width, height: view.frame.width * aspectRatio)
            imageView.center = CGPoint(x: view.center.x, y: view.center.y)
            imageView.translatesAutoresizingMaskIntoConstraints = true
            
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
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ImageViewController.recognizeTapGesture(_:)))
        imageView.addGestureRecognizer(pinchGesture)
        imageView.addGestureRecognizer(panGesture)
        imageView.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer,
                                    shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func recognizeTapGesture(sender: UITapGestureRecognizer) {
        if let navigationController = self.navigationController {
            UIView.animateWithDuration(0.5, animations: {
                if navigationController.navigationBarHidden == true {
                    self.view.backgroundColor = UIColor(white: 1, alpha: 1.0)
                    navigationController.setNavigationBarHidden(false, animated: true)
                } else {
                    self.view.backgroundColor = UIColor(white: 1, alpha: 0.0)
                    navigationController.setNavigationBarHidden(true, animated: true)
//                    UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
                }
            })
        }
    }
    
    func recognizePinchGesture(sender: UIPinchGestureRecognizer) {
        sender.delegate = self
        if let view = sender.view {
            UIView.animateWithDuration(0.07, animations: {
                view.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
                sender.scale = 1
                if sender.state == .Ended { self.resetImageToProperViewingSizeIfExceeded(view) }
            })
        }
    }
    // if let floatValue = imageView.layer.valueForKeyPath("transform.scale")?.floatValue where floatValue <= 2.0
    //
    // if sender.numberOfTouches() == 2 {
    // let touch1 = sender.locationOfTouch(0, inView: view)
    // let touch2 = sender.locationOfTouch(1, inView: view)
    // let x = ((touch1.x + touch2.x)/8)/(view.frame.height)
    // let y = ((touch1.y + touch2.y)/8)/(view.frame.width)
    // view.layer.anchorPoint = CGPoint(x: x, y: y)
    // }

    func recognisePanGesture(sender: UIPanGestureRecognizer) {
        sender.delegate = self
        sender.maximumNumberOfTouches = 2
        let translation = sender.translationInView(self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            UIView.animateWithDuration(0.3, animations: {
                if sender.state == .Ended {
                    if view.frame.width <= self.view.frame.width {
                        view.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                    } else if view.frame.origin.x > 0 {
                        view.frame.origin.x = 0
                        view.translatesAutoresizingMaskIntoConstraints = true
                    } else if view.frame.origin.x + view.frame.width < self.view.frame.width {
                        let v = self.view.frame.width - (view.frame.origin.x + view.frame.width)
                        view.frame.origin.x = view.frame.origin.x + v
                    }
                }
            })
        }
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    func resetImageToProperViewingSizeIfExceeded(view: UIView) {
        let a = view.transform.a
        if a >= 3.76 {
            UIView.animateWithDuration(0.5, animations: {
                view.transform = CGAffineTransform(a: 3.76, b: 0, c: 0, d: 3.76, tx: 0.0, ty: 0.0)
            })
        } else if a <= 1 {
            UIView.animateWithDuration(0.1, animations: {
                view.transform = CGAffineTransform(a: 1.0, b: 0, c: 0, d: 1.0, tx: 0.0, ty: 0.0)
                view.center = CGPoint(x: view.center.x, y: view.center.y)
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
