//
//  CartVcPickerViewDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


// QuantityPickerViewDelegate
extension CartViewController: QuantityPickerViewDelegate {
  
  
  // MARK: - ToolBar Done button
  
  func didTapDoneButtonOnToolBar() {
    tappedDoneButtonOnPicker()
  }

  func tappedDoneButtonOnPicker() {
    
    if
      let cellIndexPath = changedQuantityOnCellIndexPath,
      let cell = shoppingCartTableView.cellForRow(at: cellIndexPath) as? CartProductCell
    {
      cell.changeQuantityButton.resignFirstResponder()
      
      blurView.hideAnimatedAsBlur(withDuration: 0.1, delay: 0)
      
      checkProductQuantityUpdate(for: cell, on: cellIndexPath.row)

      removePickerViewFromCell(cell)
    }
  }
  
  
  // MARK: - ToolBar Cancel button
  
  func didTapCancelButtonOnToolBar() {
    dismissPickerView()
  }
  
  func dismissPickerView() {
    if
      let cellIndexPath = changedQuantityOnCellIndexPath,
      let cell = shoppingCartTableView.cellForRow(at: cellIndexPath) as? CartProductCell
    {
     
      cell.changeQuantityButton.resignFirstResponder()
      
      cell.newPickerValue = 0
      
      blurView.hideAnimatedAsBlur(withDuration: 0.1, delay: 0)
      
      removePickerViewFromCell(cell)
    }
  }
  
    
  func removePickerViewFromCell(_ cell: CartProductCell) {
    cell.changeQuantityButton.inputView = nil
    cell.changeQuantityButton.inputAccessoryView = nil
  }
  
  
  // MARK: - PickerView updates

  func didUpdatePickerView(with value: Int) {
    userDidChangePickerView(with: value)
  }
  
  func userDidChangePickerView(with value: Int ) {
    if
      let cellIndexPath = changedQuantityOnCellIndexPath,
      let cell = shoppingCartTableView.cellForRow(at: cellIndexPath) as? CartProductCell
    {
      cell.newPickerValue = value
    }
  }
  
  func checkProductQuantityUpdate(for cell: CartProductCell, on index: Int) {
    
    let newQuantityValue = cell.newPickerValue
    if
      newQuantityValue > 0,
      cell.itemCountInShoppingCart != newQuantityValue
    {
      // Update product count in the cell
      cell.changeQuantityButton.text = "\(newQuantityValue)"
      cell.itemCountInShoppingCart = newQuantityValue
      cell.newPickerValue = 0
      
      // Update the product count in CoreData
      updateProductInCartCount(for: index, with: newQuantityValue)
    }
  }
  
}

