//
//  NewsListLocalDataManager.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import CoreData

class NewsListLocalDataManager: NewsListLocalDataManagerInputProtocol {
    init() {}
    
    func retrieveNewsList() throws -> [Article]  {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw ErrorType.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Article> = NSFetchRequest(entityName: String(describing: Article.self))
        
        return try managedOC.fetch(request)
    }
    
    func saveNews(
            publishedAt: Date,
            title: String,
            descript: String,
            url: String,
            urlToImage: String,
            sourceName: String
        ) throws {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw ErrorType.managedObjectContextNotFound
        }
        
        if let newArticle = NSEntityDescription.entity(forEntityName: "Article", in: managedOC) {
            
            let article = Article(entity: newArticle, insertInto: managedOC)
            article.publishedAt = publishedAt
            article.title = title
            article.descript = descript
            article.url = url
            article.urlToImage = urlToImage
            article.sourceName = sourceName
            
            do {
                try managedOC.save()
            } catch (let error) {
                print(error.localizedDescription)
                throw ErrorType.couldNotSaveObject
            }
            
        } else {
            throw ErrorType.couldNotSaveObject
        }
        
    }
    
    func clearNewsCache() throws {
        
        guard let managedOC = CoreDataStore.managedObjectContext else {
            throw ErrorType.managedObjectContextNotFound
        }
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
       
        let _ = try managedOC.execute(request)
    }
}
