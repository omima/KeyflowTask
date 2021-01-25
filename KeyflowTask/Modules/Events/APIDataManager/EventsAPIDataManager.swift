//
//  EventsAPIDataManager.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 22/01/2021.
//

import Foundation

class EventsAPIDataManager : BaseAPIService {
    
    // MARK:- Properties
    weak var interactor: EventsInteractorInputProtocol?
    
    enum EventsEndpoint: Endpoint {
        case events
        
        var path: String {
            switch self {
            case .events:
                return "events/"
            }
        }
    }
}

extension EventsAPIDataManager {
    func fetchEventsList(_ completion: @escaping (Result<Response<EventWrapper>, Error>) -> ()) {
        execute(endPoint: EventsEndpoint.events) { (result) in
            completion(result)
        }
    }
}
