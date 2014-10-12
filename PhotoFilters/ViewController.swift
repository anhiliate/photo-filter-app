//
//  ViewController.swift
//  PhotoFilters
//
//  Created by daniel on 14-10-12.
//  Copyright (c) 2014年 beforeload. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    let context = CIContext(options: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func applyFilter(sender: UIBarButtonItem) {
        let inputImage = CIImage(image: photoImageView.image)
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        let filterImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        let renderImage = context.createCGImage(filterImage, fromRect: filterImage.extent())
        photoImageView.image = UIImage(CGImage: renderImage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

