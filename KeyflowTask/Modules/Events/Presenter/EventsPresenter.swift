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

}

// MARK:- EventsPresenterProtocol
extension EventsPresenter: EventsPresenterProtocol {
    func viewLoaded() {
        view?.showLoader()
        interactor?.loadData()
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
