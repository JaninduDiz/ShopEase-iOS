//
//  CartVcTableViewDelegate.swift
//
//
//  Created by Janindu Dissanayake
//

import UIKit


extension CartViewController: UITableViewDelegate, UITableViewDataSource {
  
  
  // MARK: - Sections
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  // MARK: - Items in section
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingCartProducts.count
  }
  
  
  // MARK: - cellForRowAt
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(
      withIdentifier: shoppingCartCellID,
      for: indexPath) as! CartProductCell
    
    let index = indexPath.row
    
    cell.cartProductCellDelegate = self
    
    let product = shoppingCartProducts[index]
    
    cell.productNameLabel.attributedText = ProductAttributedStringHelper
      .getAttributedName(from: product.name!, withSize: 18)

    let inShoppingCartCount = Int(product.count)
    
    cell.changeQuantityButton.text = "\(inShoppingCartCount)"
    cell.itemCountInShoppingCart = inShoppingCartCount

    let price = product.price
    let multipliedPriceValue = price.byItemCount(inShoppingCartCount)
    cell.productPriceLabel.text = multipliedPriceValue.toCurrencyFormat()
    

    if let imageURL = ProductInfoHelper.canCreateImageUrl(from: product.imgUrl) {
      
      let token = imageLoader?.loadImage(imageURL) { result in
        do {
          let image = try result.get()
          
          DispatchQueue.main.async {
            cell.productImageView.image = image
          }
        }
        catch {
          print("ERROR loading image with error: \(error.localizedDescription)!")
        }
      }
      
      cell.onReuse = { [unowned self] in
        if let token = token {
          self.imageLoader?.cancelImageDownload(token)
        }
      }
      
    }
    
    return cell
  }
  
  
  // MARK: - Swipe Left on Cell
    
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let removeItemAction = UIContextualAction(style: .normal, title: "") { action, sourceView, completionHandler in
      
      self.removeItemFromShoppingCart(from: indexPath.row)
      completionHandler(true)
    }
    
    removeItemAction.backgroundColor = .red
    removeItemAction.image = UIImage(systemName: "xmark")
    
    let swipeConfiguration = UISwipeActionsConfiguration(
      actions: [removeItemAction])
    return swipeConfiguration
  }
  
  
  // MARK: - Cell Height
    
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150.0
  }
  
}
