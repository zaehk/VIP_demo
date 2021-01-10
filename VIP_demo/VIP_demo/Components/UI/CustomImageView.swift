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
        
        self.image = nil
        
        imageUrlString = urlString
        guard let url = URL(string: urlString) else {
            self.setImageWithAnimation(imageToTransition: placeHolderImage)
            return
        }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString){
            self.image = imageFromCache
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let safeData = data {
                    if let downloadedImage = UIImage.init(data: safeData) {
                        if self.imageUrlString == urlString {
                            self.setImageWithAnimation(imageToTransition: downloadedImage)
                        }
                        imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    }
                    else{
                        self.setImageWithAnimation(imageToTransition: placeHolderImage)
                    }
                }
                else {
                    self.setImageWithAnimation(imageToTransition: placeHolderImage)
                }
            }
        }
        dataTask.resume()
    }
    
    private func setImageWithAnimation(imageToTransition: UIImage) {
        UIView.transition(with: self,
                          duration: 0.50,
                          options: .transitionCrossDissolve,
                          animations: { self.image = imageToTransition },
                          completion: nil)
    }
    
    var makeImageCircle: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if makeImageCircle {
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }
    }
    
}
