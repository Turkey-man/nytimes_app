//
//  SingletonArray.swift
//  NYTimesApp
//
//  Created by 1 on 11/11/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

class SingletonArray {
    private init() {}
    static let shared = SingletonArray()
    var savedArticles = [SavedArticle]()
}
