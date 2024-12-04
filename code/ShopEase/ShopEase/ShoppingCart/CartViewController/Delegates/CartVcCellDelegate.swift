//
//  CartVcCellDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension CartViewController: CartProductCellDelegate {
  
  
  // MARK: - Did Remove Item

  func didRemoveItemFromShoppingCart(from cell: CartProductCell) {
    
    if let index = shoppingCartTableView.indexPath(for: cell)?.row {
      removeItemFromShoppingCart(from: index)
    }
  }
  
  
  // MARK: - Did Change Product Quantity
  
  func didTapChangeQuantityButton(from cell: CartProductCell) {
    
    addPickerViewToChangeQuantityButton(for: cell)
    
    blurView.showAnimatedAsBlur(withDuration: 0.2, delay: 0)
    
    changedQuantityOnCellIndexPath = shoppingCartTableView.indexPath(for: cell)
    
    if let cellValue = Int(cell.changeQuantityButton.text!) {
      quantityPickerView?.selectRow(
        cellValue-1, inComponent: 0, animated: false)
    }
  }
  
  
  // MARK: - Add PickerView to Cell
  
  func addPickerViewToChangeQuantityButton(for cell: CartProductCell) {
    
    if quantityPickerView == nil { setupQuantityPickerView() }
    cell.changeQuantityButton.inputView = quantityPickerView
    cell.changeQuantityButton.inputAccessoryView = quantityPickerView?.pickerToolBar
  }
}
