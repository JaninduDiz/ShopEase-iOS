//
//  TabBarControllerDelegate.swift
//  ShopEase
//
//  Created by Janindu Dissanayake
//

import UIKit


extension TabBarController: UITabBarControllerDelegate {
  
  
  // MARK: - User tapped on TabBarItem
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
    let selectedTabIndex = tabBarController.selectedIndex
    
    if selectedTabIndex != currentTabIndex {
      currentTabIndex = selectedTabIndex
      let navController = viewController as! UINavigationController
      let viewController = navController.topViewController
      
      switch selectedTabIndex {
        case 1:
          if let currentController = viewController as? CartViewController {
            currentController.shoppingCartProducts = shoppingCartProducts
          }
        default:
          print("")
      }
    }
  }

}
