//
//  ProductOverviewVcCollectionDelegate.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension ProductOverviewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  
  // MARK: - Section count
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  // MARK: - numberOfItemsInSection
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productCollections.count
  }
  
  
  // MARK: - cellForItemAt
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: productCollectionCellID,
      for: indexPath) as! ProductCollectionCell
    
    // name of the product type
    cell.collectionNameLabel.text = CollectionProductInfoHelper
      .getProductCollectionTypeLocalizedName(from: indexPath.row)
    
    if
      let firstItem = productCollections[indexPath.row].products.first,
      let productImageURL = ProductInfoHelper.canCreateImageUrl(from: firstItem.imageUrl)
    {
      let token = imageLoader?.loadImage(productImageURL) { result in
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
  
  
  // MARK: - The cell was tapped
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let index = indexPath.row
    let productList = productCollections[index].products
    userTappedProductCollection = productList
    userTappedProductCollectionName = CollectionProductInfoHelper
      .getProductCollectionTypeLocalizedName(from: index)
    
    // Go to ProductCatalogViewController
    performSegue(withIdentifier: productCatalogSegue, sender: self)
  }
  
}
