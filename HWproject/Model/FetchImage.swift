//
//  FetchImage.swift
//  HWproject
//
//  Created by Hueijyun  on 2020/4/26.
//  Copyright © 2020 Hueijyun . All rights reserved.
//

import Foundation
import UIKit

class FetchImage {
    
    func loadImage(urlString: String, completionHandler: @escaping (UIImage) -> ())  {
      
        if let url = URL(string: urlString) {
            let urltask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let data = data,let newImage = UIImage(data: data){

                  completionHandler(newImage)
                }
            }
            
            urltask.resume()
        }
       
    }
    
}
