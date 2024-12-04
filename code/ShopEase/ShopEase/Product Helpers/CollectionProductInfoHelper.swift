//
//  CollectionProductInfoHelper.swift
//
//
//  Created by Janindu Dissanayake
//


import Foundation


// MARK: - Product Collection Types enum

// Product Collection Types
enum CollectionType: String, CaseIterable {
  case mobile
  case computer
  case laptop
  case headphone
    
  var productTypeTitle: String {
    switch self {
      case .mobile:
        return "Mobiles"
      case .laptop:
        return "Laptops"
      case .computer:
        return "Desktops"
      case .headphone:
        return "Headphones & Earphones"
    }
  }
}


struct CollectionProductInfoHelper {
  
  // MARK: - Get localized Product Collection type
  
  static  func getProductCollectionTypeLocalizedName(from index: Int) -> String {
    
    let collectionTypeCases = CollectionType.allCases
    
    if index <= collectionTypeCases.count-1 {
      let collectionName = collectionTypeCases[index].productTypeTitle
      return NSLocalizedString(
        collectionName,
        comment: "Collection type")
    }
    
    return ""
  }
  
}















