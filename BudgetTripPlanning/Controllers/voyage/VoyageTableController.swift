//
//  VoyageTableController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class VoyageTableController: NSObject, VoyageSetViewModelDelegate, UITableViewDataSource {
    func dataSetChanged() {
        
    }
    
    func voyageDeleted(at indexPath: IndexPath) {
        
    }
    
    func voyageUpdated(at indexPath: IndexPath) {
        
    }
    
    func voyageAdded(at indexPath: IndexPath) {
        
    }
    
    
    var voyageTableView : UITableView
    var voyagesViewModel : VoyageSetViewModel
    //var fetchResultController : VoyageFecthResultController
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "voyageCell", for: indexPath)
        cell.textLabel?.text = voyageSet.getAt(index: indexPath.row)?.firstname
        return cell
    }
    
    init(tableView: UITableView) {
        self.voyageTableView = tableView
        self.voyagesViewModel = VoyageSetViewModel()
        super.init()
        self.voyageTableView.dataSource = self
        self.voyagesViewModel.delegate = self
        //self.fetchResultController = VoyageFecthResultController(view: tableView)
        //self.voyagesViewModel = VoyageViewModel(data: self.fetchResultController.voaygesFetched)
    }    
}
