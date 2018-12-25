//
//  Post.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    var posts: [Post]
}

struct Post: Codable {
    var postID: Int
    var authorName: String
    var address: String
    var imagesURL: [String]
    var authorImageURL: String?
    var isLiked: Bool
    var isMarked: Bool
    var likedBy: [String]
    var message: String?
    var date: Int
   
    
    enum CodingKeys: String, CodingKey {
        case postID
        case authorName
        case address
        case imagesURL
        case authorImageURL
        case isLiked
        case isMarked
        case likedBy
        case message
        case date 
    }
    
}
