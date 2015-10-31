//
//  SecondViewController.swift
//  maskDemo
//
//  Created by Timothy Lee on 10/24/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var circleLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        circleLayer = CAShapeLayer()
        circleLayer.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        circleLayer.path = UIBezierPath(ovalInRect:circleLayer.bounds).CGPath

        view.layer.mask = circleLayer
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        CATransaction.begin()
        CATransaction.setValue(1, forKey: kCATransactionAnimationDuration)
        circleLayer.transform = CATransform3DMakeScale(20, 20, 1)
        CATransaction.commit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDismissButton(sender: AnyObject) {
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        CATransaction.setValue(1, forKey: kCATransactionAnimationDuration)
        circleLayer.transform = CATransform3DMakeScale(0.01, 0.01, 1)
        CATransaction.commit()
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
