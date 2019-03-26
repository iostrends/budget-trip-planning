//
//  VoyageTableController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class VoyageTableViewController: NSObject, VoyageSetViewModelDelegate, UITableViewDataSource {

    var voyageTableView : UITableView
    var voyagesViewModel : VoyageSetViewModel
    let fetchResultController : VoyageFetchResultController
    
    init(tableView: UITableView) {
        self.voyageTableView = tableView
        self.fetchResultController = VoyageFetchResultController(view : tableView)
        self.voyagesViewModel = VoyageSetViewModel(data: self.fetchResultController.voyagesFetched)
        super.init()
        self.voyageTableView.dataSource = self
        self.voyagesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.voyagesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "voyageCell", for: indexPath)
        cell.textLabel?.text = self.voyagesViewModel.get(voyageAt: indexPath.row)?.nom
        return cell
    }
    
    func dataSetChanged() {
        self.voyageTableView.reloadData()
    }
    
    func voyageDeleted(at indexPath: IndexPath) {
        self.voyageTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func voyageUpdated(at indexPath: IndexPath) {
       self.voyageTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func voyageAdded(at indexPath: IndexPath) {
        self.voyageTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
}
