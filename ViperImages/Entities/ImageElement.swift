//
//  ImageElement.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import Foundation

struct ImageElement: Codable {
    
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    
    init(albumID: Int, id: Int, title: String, url: String, thumbnailURL: String) {
        self.albumID = albumID
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailURL = thumbnailURL
    }

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
    
}
