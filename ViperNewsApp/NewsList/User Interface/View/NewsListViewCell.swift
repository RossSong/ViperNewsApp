//
//  NewsListViewCell.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 12.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsListViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var urlTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        urlTextView.textContainer.maximumNumberOfLines = 1
        urlTextView.textContainer.lineBreakMode = .byTruncatingTail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        newsImageView.af_cancelImageRequest()
        newsImageView.image = nil
    }
    
    func set(forNews news: ArticleModel) {

        titleTextView.text = news.title
        sourceNameLabel.text = news.sourceName
        urlTextView.text = news.url
        
        if news.urlToImage.isEmpty {
             newsImageView.image = UIImage(named: "placeholder")
        } else {
            
            if let imageUrl = URL(string: news.urlToImage) {
                if let image = UIImage(named: "placeholder") {
                    let size = CGSize(width: 110.0, height: 110.0)
                    let scaledImage = image.af_imageScaled(to: size)
                    newsImageView.af_setImage(withURL: imageUrl, placeholderImage: scaledImage)
                }
            }
            
        }
    }
}
