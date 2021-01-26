//
//  EventsInteractor.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 22/01/2021.
//

import Foundation

class EventsInteractor {
    
    // MARK:- Properties
    weak var presenter: EventsInteractorOutputProtocol?
    private let service: EventsAPIDataManager
  
    var venues = [Venues]()
    var events = [Event](){
        didSet {
            presenter?.dataIsUpdated()
        }
    }

    // MARK:- Initializers
    init(service : EventsAPIDataManager) {
        self.service = service
    }

}
// MARK:- EventsInteractorInputProtocol
extension EventsInteractor: EventsInteractorInputProtocol {
        
    func loadData()  {
        service.fetchEventsList { (result) in
            switch result {
            case .success(let response):
                if let data = response.data {
                    self.venues = data.venues
                    self.events = data.events
                }
               
            case .failure(let error):
                self.presenter?.errorOccured(error: error)
            }
        }
    }
}
