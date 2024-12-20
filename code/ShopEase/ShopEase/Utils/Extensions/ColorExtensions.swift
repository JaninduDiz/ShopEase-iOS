//
//  ColorExtensions.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension UIColor {
  
  
  // MARK: - Custom Colors
  
  static let imageBorderGray = UIColor(
    red: 209/255, green: 209/255, blue: 209/255, alpha: 1)
  
  
  // MARK: - Support Dark Mode colors
  
  static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
    return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
  }
  
}

