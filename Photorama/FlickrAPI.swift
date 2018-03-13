//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Robert Argume on 2018-03-12.
//  Copyright © 2018 Robert Argume. All rights reserved.
//

import Foundation

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI{
    private static let baseURLString = "https://api.flickr.com/services/rest"
    
    private static func flickrURL(method: Method, parameters:[String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)
        
        var queryItems = [URLQueryItem]()
        
        if let additionalParams = parameters{
            for(key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components?.queryItems = queryItems
        
        return components!.url!
    }
    
    static var interestingPhotosURL: URL {
        return flickrURL(method: .interestingPhotos, parameters: ["extras":"url_h,date_taken"])
    }
}


