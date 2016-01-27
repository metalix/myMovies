//
//  Movie+CoreDataProperties.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 26.01.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String?
    @NSManaged var year: String?
    @NSManaged var director: String?
    @NSManaged var stars: String?
    @NSManaged var desc: String?
    @NSManaged var imdbLink: String?
    @NSManaged var image: NSData?

}
