//
//  HomeController.swift
//  1970's Music App
//
//  Created by Hasani Mason on 11/2/17.
//  Copyright © 2017 Hasani Mason. All rights reserved.
//

import UIKit

//Controller for Home page
class HomeController: UIViewController
{
    @IBOutlet weak var slideshow: UIImageView!
  
    private var startIMGArray = ["img1.png", "img2.jpg", "img3.jpg","img4.jpg","img5.jpg"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //array of  images for slideshow
        var images = [UIImage]()
        
        
        //loop for images on home screen
        for i in 0...4
            
        {
            
            let image = startIMGArray[i]
            let imagebe = UIImage(named: image)!
            images.append(imagebe)
        }
        
        
        
        //animate slideshow
        slideshow.animationImages = images
        slideshow.animationDuration = Double(images.count)*5
        slideshow.animationRepeatCount = 0
        slideshow.startAnimating()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

