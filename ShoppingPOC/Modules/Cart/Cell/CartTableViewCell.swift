//
//  CartTableViewCell.swift
//  ShoppingPOC
//
//  Created by Anwesh M on 04/11/22.
//

import UIKit

class CartTableViewCell: UITableViewCell{
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    var index: Int?
    var cartItems: [ProductData]?
    var onDeleteCartClick: ((Int) ->())?
    
    
    func setup(){
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.reloadData()
        cardView.cardView(cornerRadius: 0)
        categoryNameLabel.text = cartItems?.first?.category.rawValue
        categoryNameLabel.underline()
        guard let cartItems = cartItems else{return}
        let cartPrice = cartItems.reduce(0) { partialResult, productData in
            partialResult + productData.discountedPrice
        }
        cartPriceLabel.text = "₹\(cartPrice)"
        
    }
    
    @IBAction func onDeleteCartBtnClick(_ sender: Any) {
        print("Clicked delete button")
        if let index{
            onDeleteCartClick?(index)
        }
    }
    
    @IBAction func onCheckoutBtnClick(_ sender: Any) {
        print("Clicked checkout button")
    }
    
}


extension CartTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cartItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.setup(product: cartItems![indexPath.row])
        return cell
    }
    
    
    
}


class ProductCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productUnitNameLabel: UILabel!
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var discountedPriceLabel: UILabel!
    
    
    func setup(product: ProductData){
        cardView.cardView()
        cardView.backgroundColor = .white
        productNameLabel.text = product.name
        productImageView.loadImage(url: product.imageURL)
        productUnitNameLabel.text = product.unitName
        actualPriceLabel.attributedText = "₹\(product.actualPrice)".strikeThrough()
        discountedPriceLabel.text = "₹\(product.discountedPrice)"
        
    }
    
}
