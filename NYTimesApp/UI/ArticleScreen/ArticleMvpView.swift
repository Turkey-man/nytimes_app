//
//  ArticleMvpView.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

protocol ArticleMvpView {
    func showNoConnectionAlert()
    func showAddedToFavoritesAlert()
    func showAlreadyAddedAlert()
}
