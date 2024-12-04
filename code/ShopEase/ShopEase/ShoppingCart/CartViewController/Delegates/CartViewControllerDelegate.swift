//
//  CartViewControllerDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import Foundation


protocol CartViewControllerDelegate: AnyObject {
  
  func updateShoppingCartProducts(_ products: [ShoppingCartProduct])
  
  func updateProductsInShoppingCart(
    on viewController: CartViewController)
  
  func updateTabBarBadge()
  
}
