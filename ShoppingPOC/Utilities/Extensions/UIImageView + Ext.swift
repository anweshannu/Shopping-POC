//
//  UIImageView + Ext.swift
//  ShoppingPOC
//
//  Created by Anwesh M on 04/11/22.
//

import UIKit
import Nuke

extension UIImageView{
    
    func loadImage(url: String){
        // 1
        let options = ImageLoadingOptions(
          placeholder: UIImage(named: "dark-moon"),
          transition: .fadeIn(duration: 0.5)
        )
        guard let url = URL(string: url) else{ print("Invalid image URL"); return }
        // 2
        Nuke.loadImage(with: url, options: options, into: self)
    }
    
}
