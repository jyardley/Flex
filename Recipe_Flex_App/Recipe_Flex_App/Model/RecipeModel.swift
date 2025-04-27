//
//  RecipeModel.swift
//  Recipe_Flex_App
//
//  Created by Jeff Yardley on 4/23/25.
//

import Foundation

struct RecipeList: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    var id = UUID()
    let uuid: String
    let name: String
    let cuisine: String
    let photo_url_large: URL?
    let photo_url_small: URL?
    let source_url: URL?
    let youtube_url: URL?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case name
        case cuisine
        case photo_url_large
        case photo_url_small
        case source_url
        case youtube_url
    }
}


