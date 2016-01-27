//
//  MovieCell.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 26.01.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle : UILabel!
    @IBOutlet weak var movieDesc : UILabel!
    @IBOutlet weak var movieImg : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        movieDesc.text = movie.desc
        movieImg.image = movie.getMovieImage()
    }

}
