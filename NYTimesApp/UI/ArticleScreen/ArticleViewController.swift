//
//  ArticleViewController.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var articleWebKitView: WKWebView!
    
    var presenter: ArticlePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        articleWebKitView.load(URLRequest(url: URL(string: presenter.articleURL)!))
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToFavoritesButtonTapped))
    }
    
    @objc func addToFavoritesButtonTapped() {
        presenter.addToFavorites()
    }
}

extension ArticleViewController: ArticleMvpView {
    func showNoConnectionAlert() {
        Alerts.showNoConnectionAlert(vc: self)
    }
    
    func showAddedToFavoritesAlert() {
        Alerts.showAddedToFavoritesAlert(vc: self)
    }
    
    func showAlreadyAddedAlert() {
        Alerts.showAlreadyAddedAlert(vc: self)
    }
}
