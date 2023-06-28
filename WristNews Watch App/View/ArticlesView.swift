//
//  ArticlesView.swift
//  WristNews Watch App
//
//  Created by Phi Anh on 6/25/23.
//

import SwiftUI

struct ArticlesView: View {
    @ObservedObject var articleManager = ArticleFetcher()
    
    var body: some View {
        VStack {
            Text("Articles")
            if (self.articleManager.fetchError == true) {
                Text("There was an error while fetching your news")
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.articleManager.fetchArticles()
                }) {
                    Text("Try Again")
                }

            } else {
                List(self.articleManager.articles) { article in
                    NavigationLink(destination: ArticleDetail(article: article)) {
                        ArticleRow(article: article)
                    }
                }
            }
        }.onAppear {
            self.articleManager.fetchArticles()
        }
    }
}

struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesView()
    }
}
