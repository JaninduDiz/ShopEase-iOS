//
// ImageDownloader.swift
// 
// Created by Janindu Dissanayake
 



import Foundation
import UIKit


class ImageDownloader {
  
  
  // MARK: - Properties
  
  private var loadedImages: [URL: UIImage] = [:]
  private var runningRequests: [UUID: URLSessionDataTask] = [:]
  
  
  // MARK: - Load Images from a URL
  
  func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {
    
    if let image = loadedImages[url] {
      completion(.success(image))
      return nil
    }
    
    let uuid = UUID()
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      defer {
        self.runningRequests.removeValue(forKey: uuid)
      }
      
      // Get image and cache it
      if
        let data = data,
        let image = UIImage(data: data)
      {
        self.loadedImages[url] = image
        completion(.success(image))
        return
      }
      
     
      guard let error = error else {
        return
      }
      
     
      guard (error as NSError).code == NSURLErrorCancelled else {
        completion(.failure(error))
        return
      }
    }
    task.resume()
    
    runningRequests[uuid] = task
    return uuid
    
  }
  
  
  // MARK: - Cancel in-progress task
  
  func cancelImageDownload(_ uuid: UUID) {
    runningRequests[uuid]?.cancel()
    runningRequests.removeValue(forKey: uuid)
  }
  
}
