//
//  ProductPageVcCheckmark.swift
//
//
//  Created by Janindu Dissanayake

import UIKit



extension ProductPageViewController {
  
  
  // MARK: - Setup the Checkmark animation

  func setupCheckmarkAnimation() {
    checkmark = CheckmarkView()
    let checkmarkHeight = addToCartButton.frame.height-4
    let checkMarkRect = CGRect(
      x: 0, y: 0,
      width: checkmarkHeight, height: checkmarkHeight)
    
    checkmark.setupAnimation(
      frame: checkMarkRect,
      animatedLayerColor: .white,
      strokeWidth: 4,
      animated: true
    )
    
    checkmarkBGView.addSubview(self.checkmark)
    
    setupCheckmarkDependentUI()
    animateCheckmark()
  }
  
  
  // MARK: - Prepare AddToCart button
  
  func setupCheckmarkDependentUI() {
    setupAddToCartButton(isEnabled: false)
  }
  
  
  // MARK: - Animate Checkmark

  func animateCheckmark() {
    
    checkmark.animate(duration: 0.2) { finished in
      
      if finished {
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          
          // remove the checkmark after it's done animating
          self.checkmark.removeFromSuperview()
          self.checkmark = nil
          
          // set Add to cart text
          self.setupAddToCartButton(isEnabled: true)
          
        }
        
      }
    }
    
  }
  
}
