//
//  Venues.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation

struct Venues : Codable {

    var id: Int
    var name : String
    var description : String
    
    enum CodingKeys : String , CodingKey {
        case id = "venueId"
        case name = "venueName"
        case description = "venueDescription"
    }
}
