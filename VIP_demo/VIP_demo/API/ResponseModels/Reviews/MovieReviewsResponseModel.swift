//
//  MovieReviewsResponseModel.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 09/01/2021.
//

import Foundation

// MARK: - Welcome
struct MovieReviewsResponseModel: Codable {
    let id, page: Int?
    let results: [ReviewResultResponseModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ReviewResultResponseModel: Codable {
    let author: String?
    let authorDetails: AuthorDetailsResponseModel?
    let content, createdAt, id, updatedAt: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - AuthorDetails
struct AuthorDetailsResponseModel: Codable {
    let name, username: String?
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
