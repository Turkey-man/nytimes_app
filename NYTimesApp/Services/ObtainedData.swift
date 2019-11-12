//
//  ObtainedData.swift
//  NYTimesApp
//
//  Created by 1 on 11/9/19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import Foundation

struct ObtainedData: Codable {
    let status: String
    let results: [Article]
}

struct Article: Codable {
    let title: String
    let url: String
}
