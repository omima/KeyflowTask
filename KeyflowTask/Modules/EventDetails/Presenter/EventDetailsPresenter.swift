//
//  EventDetailsPresenter.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 26/01/2021.
//


import Foundation

class EventDetailsPresenter {
    
    // MARK:- Properties
    weak var view: EventDetailsViewProtocol?
    var interactor: EventDetailsInteractorInputProtocol?
    var wireFrame: EventDetailsWireFrameProtocol?

    
}

// MARK:- EventDetailsPresenterProtocol
extension EventDetailsPresenter: EventDetailsPresenterProtocol {
    func viewLoaded() {
        guard let inter = interactor else { return }
        view?.configureEventDetails(with: inter.event)
    }
    
    
}

// MARK:- EventDetailsInteractorOutputProtocol
extension EventDetailsPresenter: EventDetailsInteractorOutputProtocol {
    
}
