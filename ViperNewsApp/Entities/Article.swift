//
//  Arcticle.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 11.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import CoreData

public class Article: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }
    
    @NSManaged public var publishedAt: Date
    @NSManaged public var sourceName: String?
    @NSManaged public var title: String?
    @NSManaged public var descript: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToImage: String?
}
