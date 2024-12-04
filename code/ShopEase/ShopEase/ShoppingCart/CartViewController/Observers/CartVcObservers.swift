//
//  CartVcObservers.swift
//
//
//  Created by Janindu Dissanayake
//

import Foundation


// "Add To Cart" Observer

extension CartViewController {
  
  
  // MARK: - Setup Observer
  func setupCartUpdateOberserver() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(didUpdateShoppingCart(_:)),
      name: Notification.Name(updateShoppingCartObserverName),
      object: nil
    )
  }
  
  
  // MARK: - Observer Action
  @objc func didUpdateShoppingCart(_ notification: Notification) {
    cartViewControllerDelegate?.updateProductsInShoppingCart(on: self)
    reloadShoppingTableView = true
  }
}
