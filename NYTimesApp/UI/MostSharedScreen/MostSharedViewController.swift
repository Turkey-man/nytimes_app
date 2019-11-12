//
//  MostSharedViewController.swift
//  NYTimesApp
//
//  Created by 1 on 11/7/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

class MostSharedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MostSharedPresenter!
    var refreshControl: UIRefreshControl!
    let networkMethods = NetworkMethods()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = MostSharedPresenter(view: self)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setupTableView()
        self.presenter.onStart()
    }
    
    func setupTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Loading")
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
    
    @objc func refresh(sender: AnyObject) {
        self.tableView.reloadData()
        print("reloaded")
        self.refreshControl.endRefreshing()
        print("Ended")
    }
}

extension MostSharedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.presenter.titlesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Article", bundle: Bundle.main)
        let viewController = storyboard
            .instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        viewController.presenter = ArticlePresenter(view: viewController)
        viewController.presenter.articleURL = self.presenter.linksArray[indexPath.row]
        viewController.presenter.articleTitle = self.presenter.titlesArray[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MostSharedViewController: MostSharedMvpView {
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showNoConnectionAlert() {
        Alerts.showNoConnectionAlert(vc: self)
    }
}
