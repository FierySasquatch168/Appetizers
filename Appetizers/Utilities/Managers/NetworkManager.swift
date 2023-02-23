//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url) // returns (data, URLResponse) not optional
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    //    func getAppetizers(completion: @escaping (Result<[Appetizer], APError>) -> Void) {
    //        guard let url = URL(string: appetizerURL) else {
    //            completion(.failure(.invalidURL))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    //            if let _ = error {
    //                completion(.failure(.unableToComplete))
    //                return
    //            }
    //            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300 else {
    //                completion(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completion(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
    //                completion(.success(decodedResponse.request))
    //            } catch {
    //                completion(.failure(.invalidData))
    //            }
    //        }
    //        task.resume()
    //    }
    
    
    func downloadImage(fromURLStirng urlString: String, completion: @escaping (UIImage?)-> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        task.resume()
    }
}
