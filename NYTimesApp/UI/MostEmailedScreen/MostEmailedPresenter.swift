//
//  MostEmailedPresenter.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

class MostEmailedPresenter {
    
    var view: MostEmailedMvpView?
    let networkMethods = NetworkMethods()
    var titlesArray = [String]()
    var linksArray = [String]()
    
    init(view: MostEmailedMvpView) {
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
        networkMethods.getMostEmailedArticles { (articles) in
            for article in 1...articles.results.count-1 {
                self.titlesArray.append(articles.results[article].title)
                self.linksArray.append(articles.results[article].url)
                self.view?.reloadTable()
            }
        }
    }
}
