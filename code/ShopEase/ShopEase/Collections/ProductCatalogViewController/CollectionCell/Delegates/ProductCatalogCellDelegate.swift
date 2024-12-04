//
//  ProductCatalogCellDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


protocol ProductCatalogCellDelegate: AnyObject {
  
  func didTapAddToCartButton(
    fromProductCatalogCell cell: ProductCatalogCell)
  
}
