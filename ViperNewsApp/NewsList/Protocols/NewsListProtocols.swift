//
//  NewsListProtocols.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import UIKit

protocol NewsListViewProtocol: class {
    var presenter: NewsListPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showNews(with news: [ArticleModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol NewsListWireFrameProtocol: class {
    static func createNewsListModule() -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    
    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: ArticleModel)
}

protocol NewsListPresenterProtocol: class {
    var view: NewsListViewProtocol? { get set }
    var interactor: NewsListInteractorInputProtocol? { get set }
    var wireFrame: NewsListWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func viewDidLoad()
    func showNewsDetail(forNews news: ArticleModel)
}

protocol NewsListInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func didRetrieveNews(_ news: [ArticleModel])
    func onError()
}

protocol NewsListInteractorInputProtocol: class
{
    var presenter: NewsListInteractorOutputProtocol? { get set }
    var APIDataManager: NewsListAPIDataManagerInputProtocol? { get set }
    var localDatamanager: NewsListLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getNewsList()
}

protocol NewsListDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol NewsListAPIDataManagerInputProtocol: class
{
     var remoteRequestHandler: NewsListAPIDataManagerOutputProtocol? { get set }
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func getNewsList()
}

protocol NewsListAPIDataManagerOutputProtocol: class
{
    /**
     * Add here your methods for communication APIDATAMANAGER -> INTERACTOR
     */

    func didRetreiveNews(_ news: [ArticleModel])
    func onError()
}

protocol NewsListLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
    func getNewsList() throws -> [Article]
    func clearNewsCache() throws
    func saveNews(publishedAt: Date,
                  title: String,
                  descript: String,
                  url: String,
                  urlToImage: String,
                  sourceName: String) throws
}
