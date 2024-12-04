//
// JsonLoader.swift
// 
//Created by Janindu Dissanayake
 

// Load the data from the "products.json" file

import Foundation

struct JsonLoader {
  
  
  // MARK: - Load JSON Data

  static func decodingJsonData(from fileName: String) -> ProductInformation?  {

    var data: Data

    if let path = Bundle.main.url(forResource: fileName, withExtension: "json") {

      do {
        data = try Data(contentsOf: path)
      }
      catch {
        print("ERROR loading JSON data: \(fileName), with error: \(error.localizedDescription)")
        return nil
      }

      do {

        let decoder = JSONDecoder()
        let information = try decoder
          .decode(ProductInformation.self, from: data)
        return information

      }
      catch let error {
        print("ERROR: \(error.localizedDescription)")
        return nil
      }
    }
    return nil
  }
  
  
  // MARK: - Return Product Collections
  
  static func returnProductCollectionTypeArray(from fileName: String) -> [ProductCollection] {

    if let infoArray = decodingJsonData(from: fileName) {

      let array = infoArray.products

      let collectionTypes = CollectionType.allCases
      var productCollections: [ProductCollection] = []
      
      for type in collectionTypes {
        
        let typeRawValue = type.rawValue

        let newArr = array.filter {
          $0.type == typeRawValue
        }

        let collection = ProductCollection(
          type: typeRawValue, products: newArr)
        
        productCollections.append(collection)
      }
      
      return productCollections
    }

    return []
  }
  
}





