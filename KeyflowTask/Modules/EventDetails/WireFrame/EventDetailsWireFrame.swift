//
//  EventDetailsWireFrame.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 26/01/2021.
//

import Foundation
import UIKit

class EventDetailsWireFrame: EventDetailsWireFrameProtocol {
	
	// MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "EventDetailsView"
    }
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createEventDetailsView(with event: EventViewModel) -> EventDetailsView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! EventDetailsView
        let presenter: EventDetailsPresenterProtocol & EventDetailsInteractorOutputProtocol = EventDetailsPresenter()
        let service = EventDetailsAPIDataManager()
        let interactor: EventDetailsInteractorInputProtocol = EventDetailsInteractor(with: service, event: event)
        let wireFrame: EventDetailsWireFrameProtocol = EventDetailsWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
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
