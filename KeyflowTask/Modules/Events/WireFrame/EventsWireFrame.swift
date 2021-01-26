//
//  EventsWireFrame.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 22/01/2021.
//

import Foundation
import UIKit

class EventsWireFrame: EventsWireFrameProtocol {
	
	// MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "EventsView"
    }
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createEventsView() -> EventsView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! EventsView
        let presenter: EventsPresenterProtocol & EventsInteractorOutputProtocol = EventsPresenter()
        let service = EventsAPIDataManager()
        let interactor: EventsInteractorInputProtocol = EventsInteractor(service: service)
        let wireFrame: EventsWireFrameProtocol = EventsWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func openDetails(from view:EventsViewProtocol, with event: EventViewModel){
        let detailsView = EventDetailsWireFrame.createEventDetailsView(with: event)
        if let sourceView = view as? UIViewController {
            sourceView.present(detailsView, animated: true, completion: nil)
        }
    }
    
    static var storyBoard: UIStoryboard {
        get {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
            }else{
                return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
            }
        }
    }
}
