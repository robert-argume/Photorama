//
//  PhotoStore.swift
//  Photorama
//
//  Created by Robert Argume on 2018-03-12.
//  Copyright © 2018 Robert Argume. All rights reserved.
//

import Foundation

class PhotoStore {
    private let session: URLSession = {
        
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
        
    }()
    
    func fetchInterestingPhotos() {
        
        let url = FlickrAPI.interestingPhotosURL
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                }
            } else if let requestError = error {
                print("Error fetching interesting photos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }
        
        task.resume()
    }


}
