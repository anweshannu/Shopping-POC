    //
    //  ShopItemModel.swift
    //  ShoppingPOC
    //
    //  Created by Anwesh M on 04/11/22.
    //

import Foundation

    // MARK: - DataClass
struct CartData {
    let cartItems: [ProductData]?
    let cartQuantity, cartTotal: Int?
}


    // MARK: - Product
struct ProductData {
    let name: String
    let imageURL: String
    let actualPrice: Int
    let discountedPrice: Int
    let unitName: String // 1kg, 2Litres
    let quantity: Int
    let category: Category
}

enum Category: String, CaseIterable{
    case miniBaskets = "Mini Baskets"
    case designerHub = "Designer hub"
}

