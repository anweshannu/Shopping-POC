    //
    //  CartViewViewController.swift
    //  ShoppingPOC
    //
    //  Created by Anwesh M on 04/11/22.
    //

import UIKit

class CartViewViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    private var totalCarts: [CartData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        cartTableView.dataSource = self
        loadSampleData()
    }
    
    func loadSampleData(){
        let product1 = ProductData(name: "Kinnaur Apple", imageURL: "https://www.keepers-nursery.co.uk/imagelibrary/products/api.jpg", actualPrice: 199, discountedPrice: 159, unitName: "1 kg", quantity: 1, category: .miniBaskets)
        let product2 = ProductData(name: "Yello Pumpkin", imageURL: "https://jammubasket.com/images/products/1543_pumpkin-yellow-cut-ripe-1-kg-a4c2bf24eee8516ca1661bea7866ff2a.jpeg", actualPrice: 44, discountedPrice: 40, unitName: "1 kg", quantity: 1, category: .miniBaskets)
        let product3 = ProductData(name: "Small tiny Grapes", imageURL: "https://solidstarts.com/wp-content/uploads/Green-Grape-scaled.jpg", actualPrice: 160, discountedPrice: 110, unitName: "1 kg", quantity: 1, category: .miniBaskets)
        let cart1Items = [product1, product2, product3]
        let cartTotal = cart1Items.reduce(0){ partialResult, productData in
            partialResult + productData.discountedPrice
            
        }
        let cart1 = CartData(cartItems: cart1Items, cartQuantity: cart1Items.count, cartTotal: cartTotal)
        totalCarts.append(cart1)
        
        let product21 = ProductData(name: "Kurtis", imageURL: "https://assets.ajio.com/medias/sys_master/root/20211130/XR7r/61a65515f997ddf8f1279aab/-473Wx593H-463403096-maroon-MODEL.jpg", actualPrice: 800, discountedPrice: 400, unitName: "6", quantity: 1, category: .designerHub)
        let product22 = ProductData(name: "Shirt", imageURL: "https://assets.ajio.com/medias/sys_master/root/20220812/hgVH/62f55ef4f997dd03e23f2d49/-1117Wx1400H-461866963-blue-MODEL.jpg", actualPrice: 1000, discountedPrice: 600, unitName: "1", quantity: 1, category: .designerHub)
        let product23 = ProductData(name: "Jeans", imageURL: "https://images.bewakoof.com/t640/men-s-blue-washed-slim-fit-mid-rise-clen-look-light-faded-jeans-342638-1656173163-1.jpg", actualPrice: 3000, discountedPrice: 2000, unitName: "1 kg", quantity: 1, category: .designerHub)
        let cart21Items = [product21, product22, product23]
        let cartTotal2 = cart21Items.reduce(0){ partialResult, productData in
            partialResult + productData.discountedPrice
            
        }
        let cart2 = CartData(cartItems: cart21Items, cartQuantity: cart21Items.count, cartTotal: cartTotal2)
        totalCarts.append(cart2)
    }
}

extension CartViewViewController{
    
    func setupNavBar(){
        let leftBarItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(onBackClick))
        leftBarItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house.fill"), style: .plain, target: self, action: #selector(onHomeIconClick))
    }
    
    @objc func onHomeIconClick(){
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func onBackClick(){
        self.tabBarController?.selectedIndex = 0
    }
}


extension CartViewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        totalCarts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.cartItems = totalCarts[indexPath.row].cartItems
        cell.setup()
        cell.index = indexPath.row
        cell.onDeleteCartClick = { [self] index in
            totalCarts.remove(at: index)
            tableView.reloadData()
        }
        return cell
    }
    
}
