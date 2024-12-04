//
// CartViewController.swift
// 
// 
//Created by Janindu Dissanayake
 


import UIKit
import UserNotifications
import CoreData


class CartViewController: UIViewController {

  
  // MARK: - Properties
  
  // Core Data
  var coreDataService: CoreDataService!
  var shoppingCartProducts: [ShoppingCartProduct] = []
  
  // Delegate
  weak var cartViewControllerDelegate: CartViewControllerDelegate?
  
  // Observer Name
  let updateShoppingCartObserverName = "updateShoppingCartObserver"
  var reloadShoppingTableView = false
  
  // Blur View
  @IBOutlet weak var blurView: UIView!
  
  // Shopping Cart Table View
  @IBOutlet weak var shoppingCartTableView: UITableView!
  let shoppingCartCellID = "CartProductCell"
  let zeroInsets = UIEdgeInsets.zero
  
  // Total Shopping Amount
  @IBOutlet weak var totalTitleLabel: UILabel!
  @IBOutlet weak var totalShoppingAmountLabel: UILabel!
  
  // Image Loader
  var imageLoader: ImageDownloader?
  
  // Change Product Quantity
  var quantityPickerView: QuantityPickerView?
  var changedQuantityOnCellIndexPath: IndexPath?
  
  
  // MARK: - View Controller's Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Navigation Bar
    setupNavigationBar()
    

    setupViewTapGesture(
      for: blurView,
      withAction: #selector(didCancelPickerView))
    
    setupProductsTableViewInsets()
    ObjectCollectionHelper.setupTableView(
      shoppingCartCellID, for: shoppingCartTableView, in: self)

    // Shopping Cart total price Labels
    setupTotalPriceTitleLabel()
    setupTotalPriceLabel()
    
    // Shopping Cart update observer
    setupCartUpdateOberserver()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if reloadShoppingTableView {
      reloadShoppingTableView = false
      setupTotalPriceLabel()
      shoppingCartTableView.reloadData()
    }
  }
  
  
  // MARK: - View transition
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    
    coordinator.animate { (_) in
      self.navigationController?.navigationBar.sizeToFit()
    }
  }
  
}


// MARK: - Setup UI 
extension CartViewController {
  
  func setupNavigationBar() {
    title = NSLocalizedString(
      "Shopping Cart",
      comment: "Cart View Controller title")
  }
  
  func setupProductsTableViewInsets() {
    shoppingCartTableView.layoutMargins = zeroInsets
    shoppingCartTableView.separatorInset = zeroInsets
    shoppingCartTableView.contentInset = UIEdgeInsets(
      top: 24, left: 0, bottom: 24, right: 0)
  }
  
  func setupTotalPriceTitleLabel() {
    totalTitleLabel.text = NSLocalizedString(
      "Total",
      comment: "Total price label title in CartViewController")
  }
  
  func setupTotalPriceLabel() {
    // Get the total price from CoreData
    let totalPriceAmount = coreDataService
      .getShoppingCartTotalAmount()
    totalShoppingAmountLabel.text = totalPriceAmount.toCurrencyFormat()
  }
  
  // Setup Quantity PickerView
  func setupQuantityPickerView() {
    quantityPickerView = QuantityPickerView()
    quantityPickerView?.setupPickerView()
    quantityPickerView?.quantityPickerViewDelegate = self
  }
  
}


// MARK: - Add Tap Gesture to BlurView
extension CartViewController {
  
  // tap Gesture to a view
  func setupViewTapGesture(for aView: UIView, withAction action: Selector?) {
    let blurViewTap = UITapGestureRecognizer(
      target: self, action: action)
    blurViewTap.cancelsTouchesInView = false
    aView.addGestureRecognizer(blurViewTap)
  }
  
  @objc func didCancelPickerView() {
    dismissPickerView()
  }
  
}


// MARK: - Remove products from the Shopping Cart
extension CartViewController {
  
  // Remove a product from the Shopping Cart
  func removeItemFromShoppingCart(from index: Int) {
    
    let product = shoppingCartProducts[index]

    let itemCount = Int(product.count)
    
    updateTotalPriceInCoreData(with: product.price, itemCount: -itemCount)
    
    // Update the total price label
    setupTotalPriceLabel()
    
    // Remove product from Shopping Cart in TabBarController
    deleteShoppingCartProductFromCoreData(from: index)
    cartViewControllerDelegate?.updateShoppingCartProducts(shoppingCartProducts)
    
    // Reload the ShoppingCartTableView
    shoppingCartTableView.reloadData()
  }
  
  func deleteShoppingCartProductFromCoreData(from index: Int) {
    let product = shoppingCartProducts[index]
    let count = product.count
    
    // Update Core Data
    coreDataService.updateShoppingCartProductCount(by: -Int(count))
    
    coreDataService.deleteProduct(product)
    
    // Update array
    shoppingCartProducts.remove(at: index)
  }
  
}


// MARK: - Update Shopping Cart product count
extension CartViewController {
  
  // Update the product count in the Shopping Cart
  func updateProductInCartCount(for index: Int, with newItemCount: Int) {
    
    let currentProduct = shoppingCartProducts[index]
    
    // How many of the same product were in the Shopping Cart
    let oldItemCount = Int(currentProduct.count)
    
    // differenced between old and new product count values
    let difference =  newItemCount - oldItemCount
    
    // Make sure the product quantity has changed
    if difference != 0 {
      updateShoppingCart(with: newItemCount, difference: difference, on: index)
    }
  }
  
  // User did update Shopping Cart products
  func updateShoppingCart(with newCount: Int, difference: Int, on index: Int) {

    // Update the product's count on the ShoppingCart
    updateCountInShoppingCartProductInCoreData(newCount, on: index)
    coreDataService.updateShoppingCartProductCount(by: difference)

    // Update the total product price
    let productPrice = shoppingCartProducts[index].price
    updateTotalPriceInCoreData(with: productPrice, itemCount: difference)
    
    // Update the total price label
    setupTotalPriceLabel()
    
    // Update the Cart's TabBar Item badge
    cartViewControllerDelegate?.updateTabBarBadge()
    
    shoppingCartTableView.reloadData()
  }
  
  
  // Update the product's count on the ShoppingCart
  func updateCountInShoppingCartProductInCoreData(_ newItemCount: Int, on index: Int) {
    let product = shoppingCartProducts[index]
    coreDataService.updateCount(
      for: product, with: newItemCount)
  }
  
  func updateTotalPriceInCoreData(with amount: Double, itemCount: Int) {
    let newAmount = amount.byItemCount(itemCount)
    coreDataService.updateShoppingCartTotalAmount(by: newAmount)
  }
  
}




