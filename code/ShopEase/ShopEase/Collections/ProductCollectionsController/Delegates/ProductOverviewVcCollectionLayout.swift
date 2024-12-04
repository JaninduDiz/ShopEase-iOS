//
//  ProductOverviewVcCollectionLayout.swift
//
//
//  Created by Janindu Dissanayake
//


import UIKit


extension ProductOverviewViewController: UICollectionViewDelegateFlowLayout {
  
  
  // MARK: - Set the cell's size
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    
    // LANDSCAPE
    if UIDevice.current.orientation.isLandscape {
      let landscapeWidth = (view.frame.width/2.4)
      return CGSize(width: landscapeWidth, height: landscapeWidth*0.7)
    }
    
    // PORTRAIT
    let portraitWidth = view.frame.width - 40
    return CGSize(width: portraitWidth, height: portraitWidth * 0.8)
  }
  
  
  // MARK: - Collection View Insets
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
  }
  
  
  // MARK: - Cell Spacing
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  
}







