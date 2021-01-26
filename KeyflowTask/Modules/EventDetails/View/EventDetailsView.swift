//
//  EventDetailsView.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 26/01/2021.
//

import Foundation
import UIKit

class EventDetailsView: BaseViewController {
    
    // MARK:- Properties
    var presenter: EventDetailsPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var venueName: UILabel!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    // MARK: Private Methods
    // MARK: Actions
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK:- EventDetailsViewProtocol
extension EventDetailsView: EventDetailsViewProtocol {
    func configureEventDetails(with event: EventViewModel) {

        eventImage.kf.setImage(with: event.image)
        eventName.text = event.name
        eventDescription.text = event.eventDesc
        venueName.text = event.venueName
        dateLabel.text = "\(event.eventDate) \(event.startTime) - \(event.endTime)"
        
    }
}
