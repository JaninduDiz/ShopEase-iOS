//
//  ShoppingCartProduct+CoreDataProperties.swift
//  ShopEase
//
//  Created by Janindu Dissanayake
//

import Foundation
import CoreData


extension ShoppingCartProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingCartProduct> {
        return NSFetchRequest<ShoppingCartProduct>(entityName: "ShoppingCartProduct")
    }

    @NSManaged public var id: String?
    @NSManaged public var type: String?
    @NSManaged public var count: Int64
    @NSManaged public var price: Double
    @NSManaged public var name: String?
    @NSManaged public var imgUrl: String?
    @NSManaged public var shoppingCart: ShoppingCart?

}

extension ShoppingCartProduct : Identifiable {

}
