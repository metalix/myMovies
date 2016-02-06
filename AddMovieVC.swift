//
//  AddMovieVC.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 26.01.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieTitleTxt: UITextField!
    @IBOutlet weak var movieYearTxt: UITextField!
    @IBOutlet weak var movieDescTxt: UITextField!
    @IBOutlet weak var movieDirectorTxt: UITextField!
    @IBOutlet weak var movieStarsTxt: UITextField!
    @IBOutlet weak var imdbLink: UITextField!
    @IBOutlet weak var movieImage: UIImageView!
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }

    @IBAction func addMovieBtnPressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
 
    @IBAction func saveBtnPressed(sender: AnyObject) {
        if let title = movieTitleTxt.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = movieTitleTxt.text
            movie.year = movieYearTxt.text
            movie.desc = movieDescTxt.text
            movie.director = movieDirectorTxt.text
            movie.stars = movieStarsTxt.text
            movie.imdbLink = imdbLink.text
            movie.setMovieImage(movieImage.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Could not save movie")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

}
