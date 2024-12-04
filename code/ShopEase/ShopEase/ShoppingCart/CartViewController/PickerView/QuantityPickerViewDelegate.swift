//
//  QuantityPickerViewDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


protocol QuantityPickerViewDelegate: AnyObject {
  
  func didTapDoneButtonOnToolBar()
  func didTapCancelButtonOnToolBar()
  
  func didUpdatePickerView(with value: Int)
  
}
