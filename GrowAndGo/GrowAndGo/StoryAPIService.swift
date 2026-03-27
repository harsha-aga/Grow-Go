//
//  StoryAPIService.swift
//  GrowAndGo
//
//  Created by Harsha Agarwal on 3/26/26.
//

import Foundation

enum APIError: LocalizedError {
    case invalidResponse
    case badStatus(Int, String)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "We could not understand the server response."
        case let .badStatus(code, message):
            return "Server error (\(code)): \(message)"
        }
    }
}

import Foundation

final class StoryAPIService {
    private let endpoint = URL(string: "http://127.0.0.1:3000/story")!

    func generateStory(request: StoryRequest) async throws -> StoryResponse {
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(request)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let message = String(data: data, encoding: .utf8) ?? "Unknown error"
            throw NSError(domain: "StoryAPI", code: httpResponse.statusCode, userInfo: [
                NSLocalizedDescriptionKey: message
            ])
        }

        return try JSONDecoder().decode(StoryResponse.self, from: data)
    }
}
