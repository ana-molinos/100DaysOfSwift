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
    var totalOfImages = 0
    var actualImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .black
        title = "\(selectedImage ?? "") - Picture \(actualImage) of \(totalOfImages)"
        navigationItem.largeTitleDisplayMode = .never
        
        // imageView setup
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // loading selected image
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        view.addSubview(imageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
