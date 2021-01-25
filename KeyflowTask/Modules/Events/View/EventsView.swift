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
        static let cellIdentifier = "EventViewCell"

    }
    
    // MARK:- Properties
    var presenter: EventsPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
  
    // MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        registerCell()
        configureTableView()
    }
    
    // MARK: Private Methods
    fileprivate func registerCell(){
        let cityCell = UINib(nibName: Constants.cellIdentifier, bundle:nil)
        tableView.register(cityCell, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    fileprivate func configureTableView() {
        tableView.sizeHeaderToFit()
    }
}

// MARK:- EventsViewProtocol
extension EventsView: EventsViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
}

// MARK: Table view Delegate
extension EventsView : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! EventViewCell
        cell.configureEvent(with: presenter!.getEventItem(at: indexPath.row))
        return cell
    }
    
    
}
