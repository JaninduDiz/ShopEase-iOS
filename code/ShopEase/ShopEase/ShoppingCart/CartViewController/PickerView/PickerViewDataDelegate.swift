//
//  PickerViewDataDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension QuantityPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
  
  
  // MARK: - Column count
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  
  // MARK: - Rows per column
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return productCountMax
  }
  
  
  // MARK: - Add data
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "\(row+1)"
  }
  
  
  // MARK: - Update pickerView row selection
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    quantityPickerViewDelegate?.didUpdatePickerView(with: row+1)
  }
  
}
