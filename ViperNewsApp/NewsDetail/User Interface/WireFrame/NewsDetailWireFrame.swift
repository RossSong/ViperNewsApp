//
//  NewsDetailWireFrame.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailWireFrame: NewsDetailWireFrameProtocol {
    
    class func createNewsDetailModule(forNews news: ArticleModel) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NewsDetailController")
        if let view = viewController as? NewsDetailViewController {
            
            let presenter: NewsDetailPresenterProtocol = NewsDetailPresenter()
            let wireFrame: NewsDetailWireFrameProtocol = NewsDetailWireFrame()
            
            // Connecting
            view.presenter = presenter
            presenter.news = news
            presenter.view = view
            presenter.wireFrame = wireFrame
            
            return view
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
