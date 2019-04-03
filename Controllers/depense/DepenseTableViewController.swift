//
//  DepenseTableViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

class DepenseTableViewController: NSObject, DepenseSetViewModelDelegate, UITableViewDataSource {
   
    var depenseTableView : UITableView
    var depensesViewModel : DepenseSetViewModel
    let fetchResultController : PersonneFetchResultController
    
    init(tableView: UITableView) {
        self.depenseTableView = tableView
        super.init()
        self.depenseTableView.dataSource = self
        self.depensesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func dataSetChanged() {
        //
    }
    
}
