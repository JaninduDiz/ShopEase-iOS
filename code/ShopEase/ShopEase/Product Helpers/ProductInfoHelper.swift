/*
 ProductInfoHelper.swift
Created by Janindu Dissanayake
 */


import Foundation


struct ProductInfoHelper {
  
  
  // MARK: - Product Description 
  
  static func createDescriptionString(for product: Product) -> String {
    
    var resultString = ""
    
    if let productInfo = product.info {
        
      
            if let storage = productInfo.storage {
              resultString = "\(storage)" + NSLocalizedString("", comment: "Storage") + ", "
            }
            
            if let memory = productInfo.memory {
                resultString = "\(memory)" + NSLocalizedString("", comment: "Memory") + ", "
            }
       
            if let color = productInfo.color {
            resultString += NSLocalizedString(color, comment: "Color of the product")
            } else if let processor = productInfo.processor {
              resultString += NSLocalizedString(processor, comment: "Processor")
            }
        
            if let type = productInfo.type {
                resultString += NSLocalizedString(type, comment: "Connection Type")
            }
    }
    
    return resultString
  }
  
  
  // MARK: - Product ImageURL
  
  static func canCreateImageUrl(from imageUrl: String?) -> URL? {
    if
      let productImageUrlString = imageUrl,
      let productImageURL = URL(string: productImageUrlString)
    {
      return productImageURL
    }
    
    return nil
  }
  
}












