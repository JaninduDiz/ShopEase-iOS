//
//  ViewExtensions.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension UIView {
  
  
  // MARK: - Animate-in Blur View
  
  func showAnimatedAsBlur(withDuration duration: TimeInterval, delay: TimeInterval) {
    
    if self.isHidden {
      self.isHidden = false
      self.isUserInteractionEnabled = true
      
      UIView.animate(
        withDuration: duration,
        delay: delay,
        options: .curveEaseInOut,
        animations: {
          self.alpha = 1
        },
        completion: nil)
    }
  }
  
  
  // MARK: - Animate-out Blur View
  
  func hideAnimatedAsBlur(withDuration duration: TimeInterval, delay: TimeInterval) {
    
    if !self.isHidden {
      
      UIView.animate(
        withDuration: duration,
        delay: 0,
        options: .curveEaseOut,
        animations: {
          self.alpha = 0
        })
      {
          finished in
          if finished {
          self.isHidden = true
          self.isUserInteractionEnabled = false
        }
      }
      
    }
    
  }
  
  
  // MARK: - Drop-down Shadow
  
  func addDropShadow(opacity: Float, radius: CGFloat, offset: CGSize, lightColor: UIColor, darkColor: UIColor) {
    
    self.layer.masksToBounds = false
    self.layer.shadowOpacity = opacity
    self.layer.shadowRadius = radius
    self.layer.shadowOffset = offset
    self.layer.shadowColor = UIColor.dynamicColor(
      light: lightColor, dark: darkColor).cgColor
  }
  
  
  // MARK: - Add Border Style
  
  func addBorderStyle(borderWidth: CGFloat, borderColor: UIColor) {
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor.cgColor
  }
  
  
  // MARK: - Add Corner Radius
  
    func addCornerRadius(_ cornerRadius: CGFloat) {
    layer.cornerRadius = cornerRadius
    layer.masksToBounds = true
  }
  
}

