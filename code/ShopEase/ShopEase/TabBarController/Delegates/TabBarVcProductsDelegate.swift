//
//  TabBarVcProductsDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


extension TabBarController: ProductOverviewViewControllerDelegate {
  
  
  // MARK: - Update CartViewController
  
  func updateCartControllerFromProductCatalogController(with product: Product) {
    
    saveToShoppingCartInCoreData(product: product)

    let count = coreDataService.getShoppingCartCount()
    setupCartTabBarItemBadge(with: count)
    
  }
  
}
