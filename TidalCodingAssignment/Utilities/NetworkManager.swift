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
    case emptyResponse
}

extension TidalAPIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badResponse:
            return NSLocalizedString("The server returned a bad response", comment: "Bad Response")
        case .emptyResponse:
            return NSLocalizedString("The server returned an empty response", comment: "Empty Response")
        }
    }
}

actor NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/")!
    
    func fetchEmployees(from pageURL: URL? = nil) async throws -> [Employee] {
        let url = pageURL ?? baseUrl.appendingPathComponent("employees.json")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw TidalAPIError.badResponse }
        guard data.count > 0 else { throw TidalAPIError.emptyResponse }
        return try await JSONDecoder.tidalapi.decode(EmployeeResponse.self, from: data).employees
    }
}

