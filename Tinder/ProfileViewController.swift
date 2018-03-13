//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Pallav Kamojjhala on 3/13/18.
//  Copyright © 2018 Pallav Kamojjhala. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var myImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = myImage
        
        let panGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(panGestureRecognizer)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
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
