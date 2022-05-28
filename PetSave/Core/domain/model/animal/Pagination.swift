//
// Created by Simon Rofe on 26/5/22.
//

struct Pagination: Codable {
    let countPerPage: Int
    let totalCount: Int
    let currentPage: Int
    let totalPages: Int
}
