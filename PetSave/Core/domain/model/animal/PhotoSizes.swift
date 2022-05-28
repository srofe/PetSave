//
// Created by Simon Rofe on 26/5/22.
//

import Foundation

struct PhotoSizes: Codable {
    var id: Int?
    var small: URL?
    var medium: URL?
    var large: URL?
    var full: URL?
}
