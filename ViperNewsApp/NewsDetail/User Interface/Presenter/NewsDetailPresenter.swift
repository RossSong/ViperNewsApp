//
//  NewsDetailPresenter.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation

class NewsDetailPresenter: NewsDetailPresenterProtocol {
    
    weak var view: NewsDetailViewProtocol?
    var wireFrame: NewsDetailWireFrameProtocol?
    var news: ArticleModel?
    
    init() {}
    
    func viewDidLoad() {
        view?.ShowNewsDetail(forNews: news!)
    }
}
