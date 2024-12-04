//
// ProductCollectionCell.swift
// 
// 
//Created by Janindu Dissanayake


import UIKit


class ProductCollectionCell: UICollectionViewCell {

  @IBOutlet weak var containerView: UIView!
  
  // Product Collection Image
  @IBOutlet weak var productImageView: UIImageView!
  var onReuse: () -> Void = {}
  
  // Product Collection Name
  @IBOutlet weak var collectionNameLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()

    containerViewStyle()

    addDropShadowToView()
  }
  
  
  // MARK: - prepareForReuse
  
  override func prepareForReuse() {
    super.prepareForReuse()
    onReuse()
    productImageView.image = nil
  }
  
}


// MARK: - UI Style

extension ProductCollectionCell {
  
  func containerViewStyle() {
    
    containerView.addBorderStyle(
      borderWidth: 1,
      borderColor: .imageBorderGray
    )
    containerView.addCornerRadius(5)
  }
  
  func addDropShadowToView() {
    
    backgroundColor = .clear
    addDropShadow(
      opacity: 0.23,
      radius: 4,
      offset: CGSize.zero,
      lightColor: .darkGray,
      darkColor: .white
    )
  }
  
}
