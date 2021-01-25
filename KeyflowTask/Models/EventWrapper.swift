//
//  EventWrapper.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation

struct EventWrapper :Codable {
    var events :[Event]
    var venues :[Venues]
    
}


struct Response<T>: Codable where T: Codable {
    private(set) var data: T?
    private(set) var status: Int

    enum CodingKeys : String , CodingKey {
        case data = "data"
        case status = "status"
    }
}

