//
//  CoreDataMethods.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import CoreData
import UIKit

class CoreDataMethods {
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func fetchArticles() {
        let context = getContext()
        let fetchRequest: NSFetchRequest<SavedArticle> = SavedArticle.fetchRequest()
        do {
            SingletonArray.shared.savedArticles = try context.fetch(fetchRequest)
        } catch {}
    }
    
    func saveArticle(title: String, url: String) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "SavedArticle", in: context)
        let savedArticle = NSManagedObject(entity: entity!, insertInto: context) as! SavedArticle
        savedArticle.title = title
        savedArticle.url = url
        
        do {
            try context.save()
            SingletonArray.shared.savedArticles.append(savedArticle)
        } catch {}
    }
    
    func deleteArticle(closure: (IndexPath) -> Void, indexPath: IndexPath) {
            let context = getContext()
            context.delete(SingletonArray.shared.savedArticles[indexPath.row])
            SingletonArray.shared.savedArticles.remove(at: indexPath.row)
            do {
                try context.save()
                closure(indexPath)
            } catch let error as NSError {
                print("Failed to save. \(error), \(error.userInfo)")
            }
    }
}
