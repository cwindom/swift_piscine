//
//  ViewController.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 24.09.2021.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    
    let image = UIImageView()
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image"
        
        view.backgroundColor = .white
        scrollView.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(image)
        
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 10
        scrollView.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

