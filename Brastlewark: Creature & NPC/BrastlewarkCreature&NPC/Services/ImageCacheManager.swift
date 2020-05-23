//
//  ImageCacheManager.swift
//  BrastlewarkCreature&NPC
//
//  Created by  Jose  Santiago on 5/20/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
  func getImageFromCache(urlString: String, withCompletion completion: @escaping (UIImage?) -> Void) {
    let url = URL(string: urlString)
    
    image = nil
    
    if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
        self.image = imageFromCache
        completion(self.image)
        return
    }
        
    URLSession.shared.dataTask(with: url!) {
        data, response, error in
          if let response = data {
              DispatchQueue.main.async {
                  var imageToCache = UIImage(data: response)
                      if let compresedImage = imageToCache?.jpegData(compressionQuality: 0.1) {
                          imageToCache = UIImage(data: compresedImage)
                  }
                
                  imageCache.setObject(imageToCache ?? UIImage(named: Constants.defaultAvatarImage)!, forKey: urlString as AnyObject)
                  self.image = imageToCache
                  completion(self.image)
              }
          }
     }.resume()
  }
}
