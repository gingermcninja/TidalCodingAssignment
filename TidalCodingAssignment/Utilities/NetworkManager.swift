//
//  NetworkManager.swift
//  TidalCodingAssignment
//
//  Created by Paul McGrath on 1/29/26.
//

import Foundation

extension JSONDecoder {
    static var tidalapi: JSONDecoder {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .iso8601
        return d
    }
}

enum TidalAPIError: Error {
    case badResponse
}

actor NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/")!
    
    func fetchEmployees(from pageURL: URL? = nil) async throws -> [Employee] {
        let url = pageURL ?? baseUrl.appendingPathComponent("employees.json")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TidalAPIError.badResponse }
        return try await JSONDecoder.tidalapi.decode(EmployeeResponse.self, from: data).employees
        
    }
}

