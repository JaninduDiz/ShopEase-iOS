//
//  DoubleExtensions.swift
//
//
//  Created by Janindu Dissanayake
//


import Foundation


extension Double {
  
  
  // MARK: - Double to Currency String
  
  func toCurrencyFormat() -> String {
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "USD"
    formatter.maximumFractionDigits = 2
    
    return formatter.string(from: NSNumber(value: self))!
  }
  
  
  // MARK: - Multiply Double by Int
  
  func byItemCount(_ count: Int) -> Double {
    return self * Double(count)
  }
  
}
