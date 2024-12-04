//
//  TabBarVcCartDelegate.swift
//  
//
//  Created by Janindu Dissanayake
//


extension TabBarController: CartViewControllerDelegate {
  
  
  // MARK: - Remove item from Shopping Cart
  
  func updateShoppingCartProducts(_ products: [ShoppingCartProduct]) {
    shoppingCartProducts = products
    
    let count = coreDataService.getShoppingCartCount()
    setupCartTabBarItemBadge(with: count)
  }
  
  
  // MARK: - Update Shopping Cart items array
  
  func updateProductsInShoppingCart(on viewController: CartViewController) {
    viewController.shoppingCartProducts = shoppingCartProducts
  }
  
  func updateTabBarBadge() {
    let count = coreDataService.getShoppingCartCount()
    setupCartTabBarItemBadge(with: count)
  }
}






