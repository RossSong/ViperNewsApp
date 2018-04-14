//
//  NewsDetailView.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 04/11/2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailViewController: UIViewController {
    
    var presenter: NewsDetailPresenterProtocol?
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsSourceNameLabel: UILabel!
    @IBOutlet weak var newsUrlTextView: UITextView!
    @IBOutlet weak var newsDetailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        newsUrlTextView.textContainer.maximumNumberOfLines = 1
        newsUrlTextView.textContainer.lineBreakMode = .byTruncatingTail
    }
    
    deinit {
        newsImageView.af_cancelImageRequest()
        newsImageView.image = nil
    }
}

extension NewsDetailViewController : NewsDetailViewProtocol {
    
    func ShowNewsDetail(forNews news: ArticleModel) {
        
        newsSourceNameLabel.text = "\(news.sourceName), \(news.publishedAt.description(with: Locale(identifier: "ru-RU")))"
        newsUrlTextView.text = news.url
        newsDetailTextView.text = news.descript.isEmpty ? news.title : news.descript
        
        if news.urlToImage.isEmpty {
            newsImageView.image = UIImage(named: "placeholder")
        } else {
            
            if let imageUrl = URL(string: news.urlToImage) {
                if let image = UIImage(named: "placeholder") {
                    newsImageView.af_setImage(withURL: imageUrl, placeholderImage: image)
                }
            }
            
        }
    }
}
