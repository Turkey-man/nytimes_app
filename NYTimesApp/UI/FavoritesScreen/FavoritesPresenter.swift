//
//  FavoritesPresenter.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

class FavoritesPresenter {
    
    var view: FavoritesMvpView?
    let coreDataMethods = CoreDataMethods()
    var savedArticlesArray: [SavedArticle] {
        SingletonArray.shared.savedArticles
    }
    
    init(view: FavoritesMvpView) {
        self.view = view
    }
    
    func fetchArticles() {
        self.coreDataMethods.fetchArticles()
    }
    
    func deleteRow(closure: (IndexPath) -> Void, indexPath: IndexPath) {
        self.coreDataMethods.deleteArticle(closure: closure, indexPath: indexPath)
    }
}
