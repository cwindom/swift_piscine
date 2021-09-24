//
//  CollectionViewController.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 24.09.2021.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let images: [URL] = [
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/20210901_071644.jpg")!,
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/jsc2019e033347.jpg")!,
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/nasa_town_hall_bam_screen-dr.png")!,
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia23203_main_slider_after-16.jpg")!,
        //for error
        URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia2303_main_slider_after-16.jpg")!,
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Images"
        
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
    
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.minimumLineSpacing = 8
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
    
        let vc = ViewController()
        
        let imgUrl = images[indexPath.row]
        
        DispatchQueue.main.async { [weak self] in
            
            guard let imgData = try? Data(contentsOf: imgUrl) else {
                let alert = UIAlertController(title: "Oh no:(", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
            
                self?.present(alert, animated: true)
                return
            }
            
            let img = UIImage(data: imgData)
            vc.image.frame.size = img?.size ?? .zero
            vc.image.image = img
            
            vc.scrollView.contentSize = img?.size ?? .zero
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }
        
        let spacing = (flowLayout.minimumInteritemSpacing * CGFloat((images.count - 1))) + collectionView.contentInset.left + collectionView.contentInset.right
        
        let width = (collectionView.frame.width - spacing) / 2
        
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CollectionViewCell
        let imgUrl = images[indexPath.row]
        
        cell.layer.borderColor = (UIColor.black.cgColor)
        cell.layer.backgroundColor = (UIColor.black.cgColor)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        DispatchQueue.main.async { [weak self] in
            
            guard let imgData = try? Data(contentsOf: imgUrl) else {
                let alert = UIAlertController(title: "Oh no:(", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
            
                self?.present(alert, animated: true)
                return
            }
            
            cell.imageNasa.image = UIImage(data: imgData)
        }
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
}
