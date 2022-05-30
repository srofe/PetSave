//
//  RequestProtocol.swift
//  PetSave
//
//  Created by Simon Rofe on 30/5/22.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String:String] { get }
    var params: [String:Any] { get }
    var urlParams: [String:String?] { get }
    var addAuthorizationToken: Bool { get }
}
