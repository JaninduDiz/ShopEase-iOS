//
//  ObjectCollectionHelper.swift
//
//
//  Created by Janindu Dissanayake
//


import Foundation
import UIKit


struct ObjectCollectionHelper {
  
  
  // MARK: - CollectionView setup
  
  static func setupCollectionView(_ cellID: String, for collectionView: UICollectionView, in viewController: UIViewController) {
    
    collectionView.delegate = viewController as? UICollectionViewDelegate
    collectionView.dataSource = viewController as? any UICollectionViewDataSource
    
    let cellNib = UINib(nibName: cellID, bundle: nil)
    collectionView.register(
      cellNib, forCellWithReuseIdentifier: cellID)
  }
  
  
  // MARK: - TableView cell setup
  
  static func setupTableView(_ cellID: String, for tableView: UITableView, in viewController: UIViewController) {
    
    let cellNib = UINib(nibName: cellID, bundle: nil)
    tableView.register(
      cellNib, forCellReuseIdentifier: cellID)
  }
  
}










