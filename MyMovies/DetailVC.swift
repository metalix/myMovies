//
//  DetailVC.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 26.01.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    
    var movie: Movie!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        movieImage.image = movie.getMovieImage()
        movieTitleLabel.text = "\(movie.title!) (\(movie.year!))"
        movieDescLabel.text = movie.desc
        directorLabel.text = movie.director
        starsLabel.text = movie.stars
        
    }

    @IBAction func goToIMDbBtnPressed(sender: UIButton) {
        let url : String = movie.imdbLink!
        performSegueWithIdentifier("WebLink", sender: url)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebLink" {
            if let webVC = segue.destinationViewController as? WebVC {
                if let url = sender as? String {
                    webVC.url = url
                }
            }
        }
    }
    
}
