//
//  EventDetailsProtocols.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 26/01/2021.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol EventDetailsViewProtocol: class {
    var presenter: EventDetailsPresenterProtocol? { get set }
    func configureEventDetails(with event: EventViewModel)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol EventDetailsPresenterProtocol: class {
    var view: EventDetailsViewProtocol? { get set }
    var interactor: EventDetailsInteractorInputProtocol? { get set }
    var wireFrame: EventDetailsWireFrameProtocol? { get set }
    
    func viewLoaded()

}

// MARK: Interactor -> Presenter
protocol EventDetailsInteractorOutputProtocol: class {

}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol EventDetailsInteractorInputProtocol: class {
    var presenter: EventDetailsInteractorOutputProtocol? { get set }
    var event : EventViewModel { get }


}

// MARK:- Wireframe Protocols
protocol EventDetailsWireFrameProtocol: class {
    static func createEventDetailsView(with event: EventViewModel) -> EventDetailsView
}
