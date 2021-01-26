//
//  EventDetailsInteractor.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 26/01/2021.
//

import Foundation

class EventDetailsInteractor {
    
    // MARK:- Properties
    weak var presenter: EventDetailsInteractorOutputProtocol?
    
    private var service : EventDetailsAPIDataManager
    var event : EventViewModel
    
    init(with service : EventDetailsAPIDataManager, event : EventViewModel) {
        self.service = service
        self.event = event
    }
}

// MARK:- EventDetailsInteractorInputProtocol
extension EventDetailsInteractor: EventDetailsInteractorInputProtocol {
        
}
