//
//  NewsListWireFrame.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import UIKit

class NewsListWireFrame: NewsListWireFrameProtocol {
    
    class func createNewsListModule() -> UIViewController {

        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NewsNavigationController")
        if let view = navController.childViewControllers.first as? NewsListViewController {
            
            // Generating module components
            let presenter: NewsListPresenterProtocol & NewsListInteractorOutputProtocol = NewsListPresenter()
            let interactor: NewsListInteractorInputProtocol & NewsListAPIDataManagerOutputProtocol = NewsListInteractor()
            let APIDataManager: NewsListAPIDataManagerInputProtocol = NewsListAPIDataManager()
            let localDataManager: NewsListLocalDataManagerInputProtocol = NewsListLocalDataManager()
            let wireFrame: NewsListWireFrameProtocol = NewsListWireFrame()

            // Connecting
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.APIDataManager = APIDataManager
            interactor.localDatamanager = localDataManager
            APIDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        
        return UIViewController()
    }

    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: ArticleModel) {
        let newsDetailViewController = NewsDetailWireFrame.createNewsDetailModule(forNews: news)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(newsDetailViewController, animated: true)
        }
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

}
