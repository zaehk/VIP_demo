//
//  CustomImageView.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 05/01/2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String, placeHolderImage: UIImage) {
        
        imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString){
            self.image = imageFromCache
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let safeData = data {
                    if let imageToCache = UIImage.init(data: safeData) {
                        if self.imageUrlString == urlString {
                            self.image = imageToCache
                        }
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                    }
                    else{
                        self.image = placeHolderImage
                    }
                }
                else {
                    self.image = placeHolderImage
                }
            }
        }
        dataTask.resume()
    }
    
}
