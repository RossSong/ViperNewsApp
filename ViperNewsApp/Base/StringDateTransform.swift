//
//  StringDateTransform.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 13.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import ObjectMapper

class StringDateTransform : DateTransform {
    
    override func transformFromJSON(_ value: Any?) -> Date? {
        
        if let timeStr = value as? String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return formatter.date(from: timeStr)
        }
        
        return Date()
    
    }
}
