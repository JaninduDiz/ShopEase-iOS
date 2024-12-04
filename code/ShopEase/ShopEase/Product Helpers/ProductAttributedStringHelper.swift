//
//  ProductAttributedStringHelper.swift
//
//
//  Created by Janindu Dissanayake
//


import Foundation


struct ProductAttributedStringHelper {
  
  
  // MARK: - Product Name
  
  static func getAttributedName(from name: String, withSize fontSize: CGFloat) -> NSAttributedString {
    return name.toStyleString(with: fontSize, and: .bold)
  }
  
  
  // MARK: - Product Price
    
    static func getAttributedPrice(from product: Product, withSize fontSize: CGFloat) -> NSAttributedString {
        let formattedPrice = "\(product.price.currency) \(product.price.value)"
        return formattedPrice.toCurrencyAttributedString(with: fontSize)
    }
  
  
  // MARK: - Product Description
  
  static func getAttributedDescription(from product: Product, withSize fontSize: CGFloat) -> NSAttributedString? {
    
    let productDescription = ProductInfoHelper
      .createDescriptionString(for: product)
    
    if productDescription != "" {
      let attributedDescription = productDescription
        .toStyleString(with: fontSize, and: .regular)
      return attributedDescription
    }
    return nil
  }

  
}











