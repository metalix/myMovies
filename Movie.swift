//
//  Movie.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 26.01.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    func setMovieImage(img : UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        if let img = UIImage(data: self.image!) {
        return img
        } else {
            return UIImage()
        }
    }
    
}
