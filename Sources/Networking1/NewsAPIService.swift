//
//  NewsAPIService.swift
//  assignment19
//
//  Created by Mac User on 30.10.24.
//

import Foundation

public protocol NewsServiceProtocol: Sendable {
    func fetchArticles(completion: @escaping @Sendable (Result<[Article], Error>) -> Void)
}

public final class NewsAPIService: NewsServiceProtocol, Sendable {
    public init() {}
    
    public func fetchArticles(completion: @escaping @Sendable (Result<[Article], Error>) -> Void) {
        let apiKey = "710684c08eca4a0e9598127cc0b1ac7d"
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                completion(.success(result.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

public struct NewsAPIResponse: Codable {
    public let articles: [Article]
}

public enum NetworkError: Error {
    case invalidURL
    case noData
}
