//
// Created by Simon Rofe on 29/5/2022.
//

import Foundation

struct APIToken {
    let tokenType: String
    let expiresIn: Int
    let accessToken: String
    private let requestedAt = Date()
}

extension APIToken: Codable {
    enum CodingKeys: String, CodingKey {
        case tokenType
        case expiresIn
        case accessToken
    }
}

extension APIToken {
    var expiresAt: Date {
        Calendar.current.date(byAdding: .second, value: expiresIn, to: requestedAt) ?? Date()
    }

    var bearerAccessToken: String {
        "\(tokenType) \(accessToken)"
    }
}
