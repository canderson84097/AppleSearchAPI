//
//  AppStoreItem.swift
//  AppleSearch
//
//  Created by Chris Anderson on 11/21/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import Foundation


struct AppStoreItem {
    let title: String
    let subtitle: String
    let album: String
    let imageURL: String?
    
    enum ItemType: String {
        case movie = "movie"
        case song = "musicTrack"
    }
}

extension AppStoreItem {
    init?(itemType: AppStoreItem.ItemType, dict: [String: Any]) {
        if itemType == .movie {

            guard let titleFromDictionary = dict["trackName"] as? String,
                let subtitle = dict["releaseDate"] as? String, let album = dict["contentAdvisoryRating"] as? String else { return nil }
            
            let imageURL = dict["artworkUrl100"] as? String
            
            title = titleFromDictionary
            self.subtitle = subtitle
            self.album = album
            self.imageURL = imageURL
            
        } else if itemType == .song {
            
            guard let titleFromDictionary = dict["artistName"] as? String,
                let subtitle = dict["trackName"] as? String, let album = dict["collectionName"] as? String else { return nil }
            
            let imageURL = dict["artworkUrl100"] as? String
            
            title = titleFromDictionary
            self.subtitle = subtitle
            self.album = album
            self.imageURL = imageURL
        } else {
           print("forgot to add other types.")
           return nil
        }
        
         
    }
    
   
}
