//
//  EndPoint.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var base: String { get }
}

extension Endpoint {
    var base: String {
        return "https://stage-api.keyflow.com/capi/v4/"
    }
}
