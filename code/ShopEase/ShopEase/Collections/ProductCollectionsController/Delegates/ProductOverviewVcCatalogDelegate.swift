//
//  ProductOverviewVcCatalogDelegate.swift
//
//
//  Created by Janindu Dissanayake


extension ProductOverviewViewController: ProductCatalogViewControllerDelegate {
  
  
  func didTapAddToCartButtonFromProductCatalogController(for product: Product) {
    productOverviewViewControllerDelegate?
      .updateCartControllerFromProductCatalogController(with: product)
  }
  
}
