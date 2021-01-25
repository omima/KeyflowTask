//
//  EventsView.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 22/01/2021.
//

import Foundation
import UIKit

class EventsView: BaseViewController {
    
    // MARK:- Constants
    struct Constants {
    }
    
    // MARK:- Properties
    var presenter: EventsPresenterProtocol?
    
    // MARK: Outlets
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    // MARK: Private Methods

}

// MARK:- EventsViewProtocol
extension EventsView: EventsViewProtocol {
    func reloadData() {
        
    }
    
}

// MARK: Table view Delegate
extension EventsView : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
