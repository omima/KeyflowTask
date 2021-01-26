//
//  EventsPresenter.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 22/01/2021.
//


import Foundation

class EventsPresenter {
    
    // MARK:- Properties
    weak var view: EventsViewProtocol?
    var interactor: EventsInteractorInputProtocol?
    var wireFrame: EventsWireFrameProtocol?
   
    enum ImageEndponit: Endpoint {
        case image(name: String)

        var path: String{
            switch self {
            case .image(let name):
            return "https://res.cloudinary.com/keyflow/image/upload/\(name).png"
            }
        }
    }
    
  fileprivate  func getImageURL(with name : String) -> String {
        let endPoint = ImageEndponit.image(name: name)
        return endPoint.path
    }
    
    fileprivate  func getEventViewModel(at index : Int) -> EventViewModel {
        let event =  interactor!.events[index]
        let venue = interactor!.venues.first{$0.id == event.venueId}
     
        
        let image = event.images.first ?? ""
        let imageName = getImageURL(with: image)
        let imageUrl = NSURL(string: imageName)?.absoluteURL
        
        let start = DateManager.shared.getTime(from:  event.startTime)
        let end = DateManager.shared.getTime(from: event.endTime)
        let day = DateManager.shared.convertDate(with: event.startTime)
        
        let eventViewModel = EventViewModel(id: event.id, name: event.name, venueName: venue?.name ?? "", eventDesc: event.description, image: imageUrl, eventDate: day, startTime: start, endTime: end)
        return eventViewModel
    }
}

// MARK:- EventsPresenterProtocol
extension EventsPresenter: EventsPresenterProtocol {
    
    
    func viewLoaded() {
        view?.showLoader()
        interactor?.loadData()
    }
    
    func numberOfItems() -> Int {
        return  interactor?.events.count ?? 0
    }
    
    func getEventItem(at index : Int) ->  EventViewModel {
        let eventViewModel = getEventViewModel(at: index)
        return eventViewModel
    }

    func openDetailsView(at index: Int) {
        let eventViewModel = getEventViewModel(at: index)
        wireFrame?.openDetails(from: view!, with: eventViewModel)
    }
    

}

// MARK:- EventsInteractorOutputProtocol
extension EventsPresenter: EventsInteractorOutputProtocol {
    func dataIsUpdated() {
        view?.hideLoader()
        view?.reloadData()
    }
    
    func errorOccured(error: Error) {
        view?.hideLoader()
        view?.showErrorMessage(text: error.localizedDescription)
    }
}


struct EventViewModel  {
    var id : Int
    var name : String
    var venueName : String
    var eventDesc : String
    var image : URL?
    var eventDate : String
    var startTime : String
    var endTime : String
}
