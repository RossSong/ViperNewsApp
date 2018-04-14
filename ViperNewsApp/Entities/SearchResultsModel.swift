//
//  SearchResultsModel.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 13.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchResultsModel : Mappable {
    
    var status: String = ""
    var totalResults: Int?
    var articles: [ArticleModel] = []
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        status          <- map["status"]
        totalResults    <- map["totalResults"]
        articles        <- map["articles"]
    }
    
}
