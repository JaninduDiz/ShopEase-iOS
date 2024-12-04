//
//  ProductPageViewControllerDelegate.swift
//
//
//  Created by Janindu Dissanayake

protocol ProductPageViewControllerDelegate: AnyObject {
  
  func didTapAddToCartButtonFromProductPage(
    for product: Product)
  
}

