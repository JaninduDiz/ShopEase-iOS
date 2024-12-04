Please go under edit and edit this file as needed for your project.  There is no seperate documentation needed.

# Project Name - ShopEase
# Student Id - IT21151392
# Student Name - Dissanayake D.M.J.C.B

#### 01. Brief Description of Project - ShopEase is an online shopping application for electronic products such as mobile phones and computers
#### 02. Users of the System -  Individuals who seeking a platform to browse, purchase electronic products
#### 03. What is unique about your solution - ShopEase is an simple and easy to use iOS application for users to browse products and add them to cart for purchase
#### 04. Briefly document the functionality of the screens you have (Include screen shots of images)

The initial screen displays the available collections in the store for purchase. Users can select one, leading to the next screen (2nd Screen), which lists the available products under the selected categories. Users can view the products and add them to the shopping cart by pressing the cart button in the product cell. Alternatively, users can tap on a product to navigate to the product details page (3rd Screen), where they can view a larger image of the product and add it to the cart by pressing the 'Add to Cart' button. Finally, users can navigate to the Shopping Cart page (4th Screen) by tapping the 'Shopping Cart' button on the bottom tab bar. Here, they can view their cart and manage it, such as removing items or increasing the quantity of a product.

[![Screen1](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/assets/87414583/daca5929-0a5b-468a-9905-cf259d6cf090)](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/blob/main/Resources/Screen1.png)
[![Screen2](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/assets/87414583/1b808818-d4bc-4280-98b9-2d2fa375bdec)](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/blob/main/Resources/Screen2.png)
[![Screen3](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/assets/87414583/a2f8b606-7830-4967-a19d-9746f1ba2aa8)](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/blob/main/Resources/Screen3.png)
[![Screen4](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/assets/87414583/56a66a71-ccf4-4ebe-8ac4-3acd69e1dee1)](https://github.com/SE4020/SE4020-Assignment1-JaninduDiz/blob/main/Resources/Screen4.png)



#### 05. Give examples of best practices used when writing code
The code below uses consistant naming conventions for variables, uses structures and constants where ever possible.

```
struct ProductInformation: Codable {
  let products: [Product]
}

// Product Object
struct Product: Codable {
  let id: String
  let name: String
  let price: Price
  let info: Info?
  let type: String
  let imageUrl: String?
}

// Product's Price
struct Price: Codable {
  let value: Double
  let currency: String
}

// Product's Info
struct Info: Codable {
  let color: String?
  let storage: String?
  let memory: String?
  let processor: String?
  let type: String?
}
```

#### 06. UI Components used

The following components were used in the ShopEase App. 
  UIButton, UIViewController, UINavigationController, UItableview, UItableviewCell, UIImageView, UIPickerView, UIlabel

#### 07. Testing carried out

The following classes implemented unit testing for the "ImageDownloader Class" and "Product Structs"

```
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

```

```
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

```


#### 08. Documentation 

(a) Design Choices
      For the UI design, I opted for simplicity, utilizing basic iOS UIKit components. I chose a minimalist approach, incorporating simple color schemes to maintain clarity and ease of use.

(b) Implementation Decisions
       I decided to use CoreData for data storage due to its strong capabilities in managing application data. I also simplified the implementation by using some extensions to reuse specific functions.

(c) Challenges
      Integrating CoreData presented some challenges during development.Implementing certain features was challenging because they were new to me. I encountered some challenges while testing in Swift, especially since         it was my first time testing in iOS development.

#### 09. Reflection

I should have spent more time learning about CoreData and how to incorporate it into iOS projects before beginning the assignment. Also, I should have done thorough research and prototyping for the complex features beforehand to understand their requirements and potential problems better. Understanding testing in Swift took me a while, but I gained insights by watching some youtube videos and reading documentation.
  

# ShopEase-iOS
