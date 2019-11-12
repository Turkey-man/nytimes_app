//
//  Alerts.swift
//  NYTimesApp
//
//  Created by 1 on 11/10/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

struct Alerts {
    private static func showBasicAlert(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    static func showNoConnectionAlert(vc: UIViewController) {
        showBasicAlert(vc: vc, title: "No connection", message: "No Internet connection!")
    }
    
    static func showServerErrorAlert(vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Server error", message: "Failed to retrieve data!")
    }
    
    static func showAddedToFavoritesAlert(vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Added to favorites", message: "Article is added to Favorites!")
    }
    
    static func showAlreadyAddedAlert(vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Already added", message: "Article is already in Favorites!")
    }
}
