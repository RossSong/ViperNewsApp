//
//  NewsDetailProtocols.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailViewProtocol: class {
    var presenter: NewsDetailPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    
    func ShowNewsDetail(forNews news: ArticleModel)
}

protocol NewsDetailWireFrameProtocol: class {
    static func createNewsDetailModule(forNews news: ArticleModel) -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol NewsDetailPresenterProtocol: class {
    var view: NewsDetailViewProtocol? { get set }
    var wireFrame: NewsDetailWireFrameProtocol? { get set }
    var news: ArticleModel? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func viewDidLoad()
}
