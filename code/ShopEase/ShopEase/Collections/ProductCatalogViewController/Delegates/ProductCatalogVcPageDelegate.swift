//
//  ProductCatalogVcPageDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit

extension ProductCatalogViewController: ProductPageViewControllerDelegate {
  
  // Update the products in the Shopping Cart array
  func didTapAddToCartButtonFromProductPage(for product: Product) {
    
  
    productCatalogViewControllerDelegate?
      .didTapAddToCartButtonFromProductCatalogController(for: product)
    

    postToUpdateShoppingCartObserver()
  }
}
