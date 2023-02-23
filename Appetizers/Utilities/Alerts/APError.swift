//
//  APError.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
