//
//  CoreDataManager.swift
//  SimpleCrud
//
//  Created by Tenzin wangyal on 7/8/22.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager{
    //Responsible to loading the core data model.
    let persistentContainer: NSPersistentContainer
    
    init(){
        
        persistentContainer = NSPersistentContainer(name: "SimpleCrudDataModel")
        persistentContainer.loadPersistentStores{(description, error) in
            if let error = error{
                fatalError("Core Data failed \(error.localizedDescription)")
                }
            }
        }
    
    func updateMovie(){
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
    }
}
    
    func deleteMovie(movie: Movie){
        persistentContainer.viewContext.delete(movie)
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
    func getAllMovies() -> [Movie]{
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
    }
    
    func saveMovie(title: String){
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do{
            try persistentContainer.viewContext.save()
        }catch{
            print("Failed to save movie \(error)")
        }
    }
}

