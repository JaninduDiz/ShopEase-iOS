//
//  QuantityPickerView.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


class QuantityPickerView: UIPickerView {

  
  // MARK: - Properties
  
  let productCountMax = 1000
  
  // Delegate
  weak var quantityPickerViewDelegate: QuantityPickerViewDelegate?
  
  // ToolBar
  var pickerToolBar: UIToolbar!
  
  
  //MARK: - Setup Method
  func setupPickerView() {
    setupChangeQuantityPickerViewToolBar()
    dataSource = self
    delegate = self
  }
  
  
  // MARK: - Setup toolbar
  
  // Setup the Quantity PickerView's ToolBar
  func setupChangeQuantityPickerViewToolBar() {
    createPickerViewToolBar()
    addQuantityPickerViewButtons()
  }
  
  // Create the PickerView's ToolBar
  func createPickerViewToolBar() {
    pickerToolBar = UIToolbar(
      frame: CGRect(x: 0, y: 0,
                    width: frame.width, height: 24))
    
    pickerToolBar?.barStyle = UIBarStyle.default
    pickerToolBar?.isTranslucent = true
    pickerToolBar.backgroundColor = .systemBackground
    pickerToolBar?.tintColor = .label
    pickerToolBar?.sizeToFit()
    pickerToolBar?.isUserInteractionEnabled = true
  }
  
  
  // MARK: - Add ToolBar buttons
  
  // buttons of the Quantity PickerView's ToolBar
  func addQuantityPickerViewButtons() {
    

    let doneButton = createToolBarButtonItem(
      name: "Done",
      buttonStyle: .done,
      buttonAction: #selector(tappedDoneButtonOnPicker))
    
    let spaceButton = UIBarButtonItem(
      barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
      target: nil,
      action: nil)
    
    let cancelButton = createToolBarButtonItem(
      name: "Cancel",
      buttonStyle: .plain,
      buttonAction: #selector(didCancelPickerView))
    
    pickerToolBar?.setItems(
      [cancelButton, spaceButton, doneButton],
      animated: false)
  }
  
  // Create a button for the PickerView's toolBar
  func createToolBarButtonItem(name: String, buttonStyle: UIBarButtonItem.Style, buttonAction: Selector?) -> UIBarButtonItem {
    
    return UIBarButtonItem(
      title: NSLocalizedString(name, comment: "Picker ToolBar button"),
      style: buttonStyle,
      target: self,
      action: buttonAction)
  }
  
  
  // MARK: - ToolBar buttons actions
 
  @objc func tappedDoneButtonOnPicker() {
    quantityPickerViewDelegate?.didTapDoneButtonOnToolBar()
  }
  
  @objc func didCancelPickerView() {
    quantityPickerViewDelegate?.didTapCancelButtonOnToolBar()
  }
  
}


