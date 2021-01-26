//
//  Event.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation

struct Event: Codable {
    var id : Int
    var name : String
    var venueId: Int
    var startTime : String
    var endTime : String
    var images : [String]
    var description : String

}
