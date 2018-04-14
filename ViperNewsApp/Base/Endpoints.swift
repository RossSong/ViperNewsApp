//
//  Endpoints.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 11.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://newsapi.org"
    static let apiKey = "f4c6c175a71a4680913f244bcb385604"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Posts: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/v2/top-headlines"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
