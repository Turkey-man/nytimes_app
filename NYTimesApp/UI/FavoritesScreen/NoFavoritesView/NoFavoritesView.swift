//
//  NoFavoritesView.swift
//  NYTimesApp
//
//  Created by 1 on 11/11/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit

class NoFavoritesView: UIView {

    @IBOutlet var contentView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NoFavoritesView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
}
