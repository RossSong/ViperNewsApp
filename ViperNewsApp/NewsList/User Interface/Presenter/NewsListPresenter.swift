//
//  NewsListPresenter.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation

class NewsListPresenter: NewsListPresenterProtocol {
    
    weak var view: NewsListViewProtocol?
    var interactor: NewsListInteractorInputProtocol?
    var wireFrame: NewsListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.getNewsList()
    }
    
    func showNewsDetail(forNews news: ArticleModel) {
        wireFrame?.presentNewsDetailScreen(from: view!, forNews: news)
    }

    init() {}
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    
    func didRetrieveNews(_ news: [ArticleModel]) {
        view?.hideLoading()
        view?.showNews(with: news)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

