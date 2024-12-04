//
//  ProductCatalogViewControllerDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


protocol ProductCatalogViewControllerDelegate: AnyObject {
  
  func didTapAddToCartButtonFromProductCatalogController(
    for product: Product)
  
}
