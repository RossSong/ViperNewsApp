//
//  Article.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 11.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import ObjectMapper

struct ArticleModel {
    
    var publishedAt: Date = Date()
    var sourceName: String = ""
    var title: String = ""
    var descript: String = ""
    var url: String = ""
    var urlToImage: String = ""
}

extension ArticleModel : Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        publishedAt         <- (map["publishedAt"], StringDateTransform())
        sourceName          <- map["source.name"]
        title               <- map["title"]
        descript            <- map["description"]
        url                 <- map["url"]
        urlToImage          <- map["urlToImage"]
    }
}
