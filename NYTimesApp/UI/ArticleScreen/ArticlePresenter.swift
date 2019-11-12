//
//  ArticlePresenter.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

class ArticlePresenter {
    
    var view: ArticleMvpView?
    var articleTitle = ""
    var articleURL = ""
    let networkMethods = NetworkMethods()
    let savedArticlesArray = SingletonArray.shared.savedArticles
    let coreDataMethods = CoreDataMethods()
    var currentArticleAdded = false
    
    init(view: ArticleMvpView) {
        self.view = view
    }
    
    private func checkConnection() -> Bool {
        return networkMethods.checkConnection()
    }
    
    private func checkForMatch() -> Bool {
        var matchFound = false
        if !savedArticlesArray.isEmpty {
            for article in savedArticlesArray {
                if article.url! == articleURL {
                    print("MATCHING ARTICLE")
                    matchFound = true
                }
            }
        }
        return matchFound
    }
    
    func addToFavorites() {
        if !self.checkConnection() {
            view?.showNoConnectionAlert()
        } else {
            print(savedArticlesArray)
            print(checkForMatch())
            if checkForMatch() {
                print(checkForMatch())
                view?.showAlreadyAddedAlert()
            } else { if !currentArticleAdded {
                    coreDataMethods.saveArticle(title: articleTitle, url: articleURL)
                    view?.showAddedToFavoritesAlert()
                    currentArticleAdded = true
            } else {
                view?.showAlreadyAddedAlert()
                }
            }
        }
    }
}
