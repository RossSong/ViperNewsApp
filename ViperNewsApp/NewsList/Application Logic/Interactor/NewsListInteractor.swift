//
//  NewsListInteractor.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation

class NewsListInteractor: NewsListInteractorInputProtocol {

    weak var presenter: NewsListInteractorOutputProtocol?
    var APIDataManager: NewsListAPIDataManagerInputProtocol?
    var localDatamanager: NewsListLocalDataManagerInputProtocol?

    init() {}
    
    func getNewsList() {
        APIDataManager?.getNewsList()
    }
}

extension NewsListInteractor : NewsListAPIDataManagerOutputProtocol {
 
    func didRetreiveNews(_ news: [ArticleModel]) {
        presenter?.didRetrieveNews(news)
        
        do {
            try localDatamanager?.clearNewsCache()
        } catch(let error) {
            print(error.localizedDescription)
        }
        
        
        for articleModel in news {
            do {
                try localDatamanager?.saveNews(
                    publishedAt: articleModel.publishedAt,
                    title: articleModel.title,
                    descript: articleModel.descript,
                    url: articleModel.url,
                    urlToImage: articleModel.urlToImage,
                    sourceName: articleModel.sourceName)
            } catch(let error)  {
                print(error.localizedDescription)
            }
        }
    }
    
    func onError() {
        
        do {
            if let newsList = try localDatamanager?.getNewsList() {

                let articleModelList = newsList.map() {
                    return ArticleModel(
                        publishedAt: $0.publishedAt,
                        sourceName: $0.sourceName!,
                        title: $0.title!,
                        descript: $0.descript!,
                        url: $0.url!,
                        urlToImage: $0.urlToImage!)
                }

                presenter?.didRetrieveNews(articleModelList)
            }
        }
        catch {

            presenter?.didRetrieveNews([])
        }
        
        presenter?.onError()
    }
    
}
