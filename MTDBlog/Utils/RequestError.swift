//
//  RequestError.swift
//  MTDBlog
//
//  Created by Daniel Mandea on 28/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
}
