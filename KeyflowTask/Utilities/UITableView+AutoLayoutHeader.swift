//
//  UITableView+AutoLayoutHeader.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation
import UIKit

extension UITableView {
    func sizeHeaderToFit() {
        if let headerView = self.tableHeaderView {
            
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
            
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var frame = headerView.frame
            frame.size.height = height
            headerView.frame = frame
            
            self.tableHeaderView = headerView
        }
    }
}
