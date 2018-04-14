//
//  NewsListAPIDataManager.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NewsListAPIDataManager: NewsListAPIDataManagerInputProtocol {
    init() {}
    
    var remoteRequestHandler: NewsListAPIDataManagerOutputProtocol?
    
    func retrieveNewsList() {
        
        let params: [String: String] = [
            "country": "ru",
            "apiKey": API.apiKey
        ]
        
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get, parameters: params)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SearchResultsModel>) in
                switch response.result {
                    
                    case .success(let results):
                        self.remoteRequestHandler?.onNewsRetrieved(results.articles)
                    
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.remoteRequestHandler?.onError()
                    
                }
            })
    }
}
