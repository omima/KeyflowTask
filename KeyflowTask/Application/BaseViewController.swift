//
//  BaseViewController.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation
import UIKit

protocol BaseViewing: class {
    func showLoader()
    func hideLoader()
    func showSuccessMessage(text: String?)
    func showErrorMessage(text: String?)
}

class BaseViewController: UIViewController, BaseViewing {

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        return indicator
       }()

    override func viewDidLoad() {
        configureLoading()
    }
    
    func configureLoading() {
        activityIndicator.color = .lightGray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showSuccessMessage(text: String?) {
        let alertController = UIAlertController(title: "Success", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        let viewController = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorMessage(text: String?) {
        let alertController = UIAlertController(title: "ERROR", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        let viewController = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showLoader() {
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        self.activityIndicator.stopAnimating()
    }
    
}

