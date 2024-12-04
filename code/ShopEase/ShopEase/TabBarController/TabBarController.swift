//
//  TabBarController.swift
//
//
//  Created by Janindu Dissanayake
//

import UIKit
import CoreData


typealias ProductDictionary = [String:AnyObject]


class TabBarController: UITabBarController {

  // MARK: - Properties
  lazy var coreDataStack = CoreDataStack()
  var coreDataService: CoreDataService!
  
  // Tab Bar
  var currentTabIndex = 0
  
  // Image Loader
  var imageLoader: ImageDownloader?
  
  // Products
  var productCollections: [ProductCollection] = []
  
  // ShoppingCart
  var shoppingCartProducts: [ShoppingCartProduct] = []
  
  
  // MARK: - View Controller's Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // TabBar's Delegate
    delegate = self
    
    // Image Loader
    imageLoader = ImageDownloader()
    
    // Load JSON Data
    loadJsonData()
    
    // Core Data
    coreDataService = CoreDataService(coreDataStack: coreDataStack)
    loadShoppingCartFromCoreData()
    
    setupChildrenDelegates()
    
    customizeTabBarItems()
    
    setupInitialCartTabBarItemBadge()
    
    
  }

}


// MARK: - Setup UI

extension TabBarController {
  
  func customizeTabBarItems() {
    
    let tabBarItems = tabBar.items
    tabBarItems?[0].title = NSLocalizedString(
      "Collections", comment: "Collections TabBar item title")
    tabBarItems?[1].title = NSLocalizedString(
      "Shopping Cart", comment: "Cart TabBar item title")
    tabBar.tintColor = .label
    tabBar.unselectedItemTintColor = .systemGray3
  }
  
  func setupCartTabBarItemBadge(with count: Int) {
    let cartTabItem = tabBar.items?.last
    cartTabItem?.badgeValue = count > 0 ? "\(count)" : nil
  }

  func setupInitialCartTabBarItemBadge() {
    let count = coreDataService.getShoppingCartCount()
    setupCartTabBarItemBadge(with: count)
  }
  
}


// MARK: - Setup Children Delegates

extension TabBarController {
  
  func setupChildrenDelegates() {
    setupProductOverviewVcDelegate()
    setupCartVcDelegate()
  }
  
  // Child 1
  func setupProductOverviewVcDelegate() {
    
    if
      let navController = getChildNavigationController(with: 0),
      let rootController = navController.topViewController as? ProductOverviewViewController
    {
      navController.navigationBar.prefersLargeTitles = true
      rootController.productOverviewViewControllerDelegate = self
      rootController.productCollections = productCollections
      rootController.imageLoader = imageLoader
    }
  }
  
  // Child 2
  func setupCartVcDelegate() {
    
    if
      let navController = getChildNavigationController(with: 1),
      let rootController = navController.topViewController as? CartViewController
    {
      rootController.cartViewControllerDelegate = self
      rootController.coreDataService = coreDataService
      rootController.shoppingCartProducts = shoppingCartProducts
      rootController.imageLoader = imageLoader
    }
  }
  
  func getChildNavigationController(with index: Int) -> UINavigationController? {
    
    if let navController = children[index] as? UINavigationController {
      return navController
    }
    return nil
  }
  
}


// MARK: - Load the Products data

extension TabBarController {
  
  func loadJsonData() {
    let products = JsonLoader.returnProductCollectionTypeArray(
      from: "products")
    productCollections = products
  }
  
}


// MARK: - CoreData Methods

extension TabBarController {
  
  // Fetch the Shopping Cart from CoreData
  func loadShoppingCartFromCoreData() {
    shoppingCartProducts = coreDataService.getProductArray()
  }
  
  // Save new products in CoreData's ShoppingCart
  func saveToShoppingCartInCoreData(product: Product) {

    if let newProduct = coreDataService.getProduct(product.id, from: shoppingCartProducts) {
      // If the product is already in the Shopping Cart
      coreDataService.updateCount(
        for: newProduct, by: 1)
    }
    else {
      // Create a new ShoppingCartProduct
      let newProduct = coreDataService.saveNewProduct(product)
      shoppingCartProducts.append(newProduct)
    }
    
    coreDataService.updateShoppingCartProductCount(by: 1)
    
    // Update the total price in Shopping Cart
    let price = product.price.value
    coreDataService.updateShoppingCartTotalAmount(by: price)
  }

}
