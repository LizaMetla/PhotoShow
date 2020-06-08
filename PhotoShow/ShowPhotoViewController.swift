//
//  ShowPhotoViewController.swift
//  PhotoShow
//
//  Created by Елизавета Метла on 6/8/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var PhotoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoImageView.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SharePhotoAction(_ sender: Any) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
