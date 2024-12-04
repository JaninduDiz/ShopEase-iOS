//
//  ImageDownloaderTests.swift
//  ShopEaseTests
//
//  Created by Janindu Dissanayake
//

import XCTest
@testable import ShopEase

class ImageDownloaderTests: XCTestCase {

    var imageDownloader: ImageDownloader!
    
    override func setUp() {
        super.setUp()
        imageDownloader = ImageDownloader()
    }
    
    override func tearDown() {
        imageDownloader = nil
        super.tearDown()
    }
    
    // Test image loading
    func testImageLoading() {
        let imageURL = URL(string: "https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-xs/iphone-xs-silver.jpg")!
        
        let expectation = self.expectation(description: "Image loaded successfully")
        
        let _ = imageDownloader.loadImage(imageURL) { result in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Image loading failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
