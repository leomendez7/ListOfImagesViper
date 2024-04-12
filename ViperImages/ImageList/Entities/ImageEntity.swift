//
//  ImageEntity.swift
//  ViperImages
//
//  Created by Leonardo Mendez on 10/04/24.
//

import Foundation

struct ImageElement: Codable {
    
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
    
}
