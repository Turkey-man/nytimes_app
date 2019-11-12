//
//  MostSharedPresenter.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

class MostSharedPresenter {
    
    var view: MostSharedMvpView?
    let networkMethods = NetworkMethods()
    var titlesArray = [String]()
    var linksArray = [String]()
    
    init(view: MostSharedMvpView) {
        self.view = view
    }
    
    func onStart() {
        if networkMethods.checkConnection() == true {
            fetchData()
        } else {
            view?.showNoConnectionAlert()
        }
    }
    
    func fetchData() {
        networkMethods.getMostSharedArticles { (articles) in
            for article in 1...articles.results.count-1 {
                self.titlesArray.append(articles.results[article].title)
                self.linksArray.append(articles.results[article].url)
                self.view?.reloadTable()
            }
        }
    }
}
