//
//  CardsViewController.swift
//  Tinder
//
//  Created by Pallav Kamojjhala on 3/13/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var cardInitialCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        

        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        //let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            cardInitialCenter = imageView.center
            print("Gesture began")
        } else if sender.state == .changed {
            if (location.y < imageView.frame.height/2)
            { imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(translation.x) * Double.pi / 560))
            }
            else {
                imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(-1.0 * Double(translation.x) * Double.pi / 560))
            }
            
            if(translation.x > 175 || translation.x < -175) {
                UIView.animate(withDuration: 0.4, animations: {
                    self.imageView.alpha = 0
                })
            }
            print("Gesture is changing")
        } else if sender.state == .ended {
            imageView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(0.0))
            print("Gesture ended")
        }
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
