//
//  ProductCatalogVcCellDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension ProductCatalogViewController: ProductCatalogCellDelegate {
  
  // Update the products in the Shopping Cart array
  func didTapAddToCartButton(fromProductCatalogCell cell: ProductCatalogCell) {
    
    if let index = productCatalogCollectionView.indexPath(for: cell)?.row {

      let currentProduct = productList[index]
      productCatalogViewControllerDelegate?
        .didTapAddToCartButtonFromProductCatalogController(for: currentProduct)
      
      
      postToUpdateShoppingCartObserver()
    }
  }
  
}



















