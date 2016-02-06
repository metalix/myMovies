//
//  ViewController.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 25.01.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false;
        
        let logo = UIImage(named: "Movies.png")
        let imageView = UIImageView(image:logo)
        imageView.frame.size.width = 121;
        imageView.frame.size.height = 40;
        imageView.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = imageView
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResult()
        tableView.reloadData()
    }

    func fetchAndSetResult() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let result = try context.executeFetchRequest(fetchRequest)
            self.movies  = result as! [Movie]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            let movie = movies[indexPath.row]
            let numb : Int = indexPath.row
            if numb % 2 != 0 {
                cell.contentView.backgroundColor = UIColor(red: 89/255.0, green: 131/255.0, blue: 135/255.0, alpha: 1.0)
            }
            
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie: Movie!
        movie = movies[indexPath.row]
        performSegueWithIdentifier("MovieDetail", sender: movie)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "MovieDetail" {
            if let detailsVC = segue.destinationViewController as? DetailVC {
                if let movie = sender as? Movie {
                    detailsVC.movie = movie
                }
            }
        }
    }


}

