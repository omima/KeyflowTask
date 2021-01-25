//
//  EventsProtocols.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 22/01/2021.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol EventsViewProtocol: BaseViewing {
    var presenter: EventsPresenterProtocol? { get set }
    func reloadData()

}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol EventsPresenterProtocol: class {
    var view: EventsViewProtocol? { get set }
    var interactor: EventsInteractorInputProtocol? { get set }
    var wireFrame: EventsWireFrameProtocol? { get set }
   
    func viewLoaded()
    func numberOfItems() -> Int
    func getEventItem(at index : Int) ->  EventViewModel

}

// MARK: Interactor -> Presenter
protocol EventsInteractorOutputProtocol: class {
    func dataIsUpdated()
    func errorOccured(error: Error)
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol EventsInteractorInputProtocol: class {
    var presenter: EventsInteractorOutputProtocol? { get set }
    var venues : [Venues] { get }
    var events : [Event] { get }
    
    func loadData()
}

// MARK:- Wireframe Protocols
protocol EventsWireFrameProtocol: class {
    static func createEventsView() -> EventsView
}
