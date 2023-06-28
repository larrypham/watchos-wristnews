//
//  ArticleFetcher.swift
//  WristNews Watch App
//
//  Created by Phi Anh on 6/26/23.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

public class ArticleFetcher: ObservableObject {
    @Published var articles: [Article] = []
    @Published var fetchError: Bool = false
    
    let apiKey = "2a09b9ed3b2445378615637b123ff37d"
    
    func fetchArticles() {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&apiKey="+apiKey)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    let articles = json["articles"].array ?? []
                    var articleArray: [Article] = []
                    
                    for json in articles {
                        let title = json["title"].string ?? "Untitled Article"
                        let author = json["author"].string ?? "No author data"
                        let description = json["description"].string ?? "No description"
                        let link = json["url"].string ?? ""
                        let imageLink = json["urlToImage"].string ?? "https://via.placeholder.com/50x50.png?text=IMG"
                        let publishedAt = json["publishedAt"].string ?? "No version data"
                        let content = json["content"].string ?? "No article content"
                        let articleItem = Article(title: title, description: description,
                                                  author: author, link: link, imageLink: imageLink, publishedAt: publishedAt,
                                                  content: content)
                        articleArray.append(articleItem)
                    }
                    self.articles = articleArray
                    
                case .failure(let error):
                    print(error)
                    self.fetchError = true
                }
            }
    }
}
