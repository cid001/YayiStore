//
//  ProductModel.swift
//  YayiStore
//
//  Created by Yair Cid on 01/03/23.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
    let rating: Double
}

var productList: [Product] = [Product(id: 1, title: "", price: 35.12, description: "", image: "watch_1", category: "", rating: 4.7),
                              Product(id: 2, title: "", price: 20.41, description: "", image: "watch_2", category: "", rating: 4.7),
                              Product(id: 3, title: "", price: 15.45, description: "", image: "watch_3", category: "", rating: 4.7),
                              Product(id: 4, title: "", price: 16.24, description: "", image: "watch_4", category: "", rating: 4.7),
                              Product(id: 5, title: "", price: 29.34, description: "", image: "watch_5", category: "", rating: 4.7),
                              Product(id: 6, title: "", price: 28.85, description: "", image: "watch_6", category: "", rating: 4.7),
                              Product(id: 7, title: "", price: 20.25, description: "", image: "watch_7", category: "", rating: 4.7),
                              Product(id: 8, title: "", price: 40.13, description: "", image: "watch_8", category: "", rating: 4.7)]
