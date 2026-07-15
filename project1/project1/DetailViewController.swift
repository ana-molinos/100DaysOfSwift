//
//  File.swift
//  project1
//
//  Created by Ana Julia Molinos Leite Da Silva on 14/07/26.
//

import UIKit

class DetailViewController: UIViewController{
    var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // imageView setup
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // loading selected image
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        view.addSubview(imageView)
    }
}
