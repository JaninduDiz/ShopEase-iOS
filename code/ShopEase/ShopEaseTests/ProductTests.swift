//
//  ProductTests.swift
//  ShopEaseTests
//
//  Created by Janindu Dissanayake
//

import XCTest
@testable import ShopEase

class ProductTests: XCTestCase {
    
    func testProductDecoding() throws {
        let json = """
        {
            "products": [
                {
                    "id": "1",
                    "name": "iPhone 12",
                    "price": {"value": 999, "currency": "USD"},
                    "info": {"color": "Black", "storage": "128GB", "type": "Smartphone"},
                    "type": "Electronic",
                    "imageUrl": "https://example.com/iphone.jpg"
                }
            ]
        }
        """.data(using: .utf8)!

        let productInformation = try JSONDecoder().decode(ProductInformation.self, from: json)

        XCTAssertEqual(productInformation.products.count, 1)
        let product = productInformation.products[0]
        XCTAssertEqual(product.id, "1")
        XCTAssertEqual(product.name, "iPhone 12")
        XCTAssertEqual(product.price.value, 999)
        XCTAssertEqual(product.price.currency, "USD")
        XCTAssertEqual(product.info?.color, "Black")
        XCTAssertEqual(product.info?.storage, "128GB")
        XCTAssertEqual(product.type, "Electronic")
        XCTAssertEqual(product.imageUrl, "https://example.com/iphone.jpg")
    }

}
