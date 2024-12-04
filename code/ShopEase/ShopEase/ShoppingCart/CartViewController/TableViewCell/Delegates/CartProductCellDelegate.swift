//
//  CartProductCellDelegate.swift
//  
//
//  Created by Janindu Dissanayake
//
import UIKit

protocol CartProductCellDelegate: AnyObject {
  
  func didRemoveItemFromShoppingCart(from cell: CartProductCell)
  
  func didTapChangeQuantityButton(from cell: CartProductCell)
  
}

extension CartProductCell: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    cartProductCellDelegate?.didTapChangeQuantityButton(from: self)
  }
}
