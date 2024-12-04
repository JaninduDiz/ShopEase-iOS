//
// ProductPageViewController.swift
// 
// 
//Created by Janindu Dissanayake
 
import UIKit


class ProductPageViewController: UIViewController {

  
  // MARK: - Properties
  
  // Delegate
  weak var productPageViewControllerDelegate: ProductPageViewControllerDelegate?
  
  
  // Product Object
  var productObject: Product?
  
  // Product Image
  @IBOutlet weak var productImageView: UIImageView!
  
  // ScrollView - Container View
  @IBOutlet weak var containerScrollView: UIScrollView!
  
  // Product Info
  @IBOutlet weak var productNameLabel: UILabel!
  @IBOutlet weak var productDescriptionLabel: UILabel!
  @IBOutlet weak var productPriceLabel: UILabel!
  
  // Add to Cart Button
  @IBOutlet weak var addToCartButton: UIButton!
  var attributedCartButtonText: NSAttributedString?
  
  // Image Loader
  var imageLoader: ImageDownloader?
  
  // Checkmark Animation
  @IBOutlet weak var checkmarkBGView: UIView!
  var checkmark: CheckmarkView!
  
  
  // MARK: - View Controller's Life Cycle 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Navigation Bar
    setupNavigationBar()
    
    // ScrollView - Container View
    setupContainerScrollView()
    
    // Setup UI
    setAddToCartButtonText()
    setupAddToCartButton(isEnabled: true)

    // UI Style
    thumbnailStyle()
    addToCartButtonStyle()
    
    // Load Product Info
    loadImage()
    setupProductInfoLabels()
    
  }
  
  
  // MARK: - Button Actions
  
  @IBAction func addToCartButtonAction(_ sender: UIButton) {

    productPageViewControllerDelegate?
      .didTapAddToCartButtonFromProductPage(for: productObject!)
    
    setupCheckmarkAnimation()
  }
  
}


// MARK: - Setup UI

extension ProductPageViewController {
  
  func setupNavigationBar() {
    title = NSLocalizedString(
      "Product",
      comment: "Title from ProductPageViewController")
  }
  

  func setupContainerScrollView() {
    containerScrollView.contentInset = UIEdgeInsets(
      top: 0, left: 0, bottom: 120, right: 0)
  }
  

  func setAddToCartButtonText() {
    
    let addToCartButtonText = NSLocalizedString(
      "Add to Shopping Cart",
      comment: "Add to Shopping Cart Button label text")
    
    attributedCartButtonText = addToCartButtonText
      .toStyleString(with: 16, and: .semibold)
  }
  
  func setupAddToCartButton(isEnabled: Bool) {
    
    let buttonText = isEnabled ?
      attributedCartButtonText :
      NSAttributedString(string: "", attributes: nil)
    
    addToCartButton.setAttributedTitle(
      buttonText, for: .normal)
    
    addToCartButton.isEnabled = isEnabled
  }
  
}


// MARK: - UI Style

extension ProductPageViewController {
  
  func thumbnailStyle() {
    
    
    productImageView.addBorderStyle(
      borderWidth: 1,
      borderColor: .imageBorderGray)
    
    productImageView.addCornerRadius(5)

    productImageView.addDropShadow(
      opacity: 0.23,
      radius: 6,
      offset: CGSize.zero,
      lightColor: .gray,
      darkColor: .white
    )
  }
  
  func addToCartButtonStyle() {
    addToCartButton.addCornerRadius(25)
  }
  
}


// MARK: - Load Product Info

extension ProductPageViewController {
  
  func loadImage() {
    
    if
      let product = productObject,
      let imageURL = ProductInfoHelper.canCreateImageUrl(from: product.imageUrl)
    {
      
      
      let _ = imageLoader?.loadImage(imageURL) { result in
        do {
          let image = try result.get()
          
          
          DispatchQueue.main.async {
            self.productImageView.image = image
          }
        }
        catch {
          print("ERROR loading image with error: \(error.localizedDescription)!")
        }
      }
     
    }
  }
  
  func setupProductInfoLabels() {
    if let productObj = productObject {
      
      
      productNameLabel.attributedText = ProductAttributedStringHelper
        .getAttributedName(from: productObj.name, withSize: 18)
      
    
      productDescriptionLabel.attributedText = ProductAttributedStringHelper
        .getAttributedDescription(from: productObj, withSize: 18)
      
      
      productPriceLabel.attributedText = ProductAttributedStringHelper
        .getAttributedPrice(from: productObj, withSize: 34)
    }
  }
  
}
