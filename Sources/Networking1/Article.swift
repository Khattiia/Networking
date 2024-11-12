//
//  Article.swift
//  assignment19
//
//  Created by Mac User on 30.10.24.
//

import Foundation

public struct Article: Codable, Identifiable {
    public let id = UUID()
    public let title: String
    public let author: String?
    public let publishedAt: String
    public let urlToImage: String?
    public let description: String?

    private enum CodingKeys: String, CodingKey {
        case title
        case author
        case publishedAt
        case urlToImage
        case description
    }
}

