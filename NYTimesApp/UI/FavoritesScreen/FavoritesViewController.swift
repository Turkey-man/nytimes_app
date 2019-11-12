//
//  FavoritesViewController.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FavoritesPresenter!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.presenter = FavoritesPresenter(view: self)
        presenter.fetchArticles()
        setupTableView()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if self.presenter.savedArticlesArray.isEmpty {
            self.tableView.backgroundView = NoFavoritesView()
            self.tableView.separatorStyle = .none
        } else {
            self.tableView.backgroundView = UIView()
            self.tableView.separatorStyle = .singleLine
        }
    }
    
    func deleteRow(indexPath: IndexPath) {
        self.tableView.deleteRows(at: [indexPath], with: .top)
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.savedArticlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let article = self.presenter.savedArticlesArray[indexPath.row]
        cell.textLabel?.text = article.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.presenter.deleteRow(closure: deleteRow(indexPath:), indexPath: indexPath)
            if self.presenter.savedArticlesArray.isEmpty {
                self.tableView.backgroundView = NoFavoritesView()
                self.tableView.separatorStyle = .none
            } else {
                self.tableView.backgroundView = UIView()
                self.tableView.separatorStyle = .singleLine
            }
        }
    }
}

extension FavoritesViewController: FavoritesMvpView {
}
