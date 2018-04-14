//
//  NewsListView.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import UIKit
import PKHUD

class NewsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: NewsListPresenterProtocol?
    var newsList: [ArticleModel] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.addSubview(self.refreshControl)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        //self.tableView.reloadData()
        presenter?.interactor?.retrieveNewsList()
        refreshControl.endRefreshing()
    }

}

extension NewsListViewController: NewsListViewProtocol {
    
    func showNews(with news: [ArticleModel]) {
        newsList = news
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsListViewCell
        
        let news = newsList[indexPath.row]
        cell.set(forNews: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPostDetail(forNews: newsList[indexPath.row])
    }
    
}
