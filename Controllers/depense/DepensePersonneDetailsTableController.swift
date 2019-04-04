//
//  PersonneTableController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//
//
//  VoyageTableController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class DepensePersonnesDetailsTableController: NSObject, DepenseSetViewModelDelegate, UITableViewDataSource {
    
    var depenseTableView : UITableView
    var depensesViewModel : DepenseSetViewModel
    var depenseSelected : Depense?
    init(tableView: UITableView, voyage: Voyage) {
        self.depenseTableView = tableView
        self.depensesViewModel = DepenseSetViewModel(voyage: voyage)
        super.init()
        self.depenseTableView.dataSource = self
        self.depensesViewModel.delegate = self
    }
    
    init(tableView: UITableView, personne: Personne) {
        self.depenseTableView = tableView
        self.depensesViewModel = DepenseSetViewModel(personne: personne)
        super.init()
        self.depenseTableView.dataSource = self
        self.depensesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func dataSetChanged() {
        self.depenseTableView.reloadData()
    }
    
    func depenseDeleted(at indexPath: IndexPath) {
        self.depenseTableView.beginUpdates()
        self.depenseTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.depenseTableView.endUpdates()
    }
    
    func depenseUpdated(at indexPath: IndexPath) {
        self.depenseTableView.beginUpdates()
        self.depenseTableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.depenseTableView.endUpdates()
    }
    
    func depenseAdded(at indexPath: IndexPath) {
        self.depenseTableView.beginUpdates()
        self.depenseTableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.depenseTableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let depense = self.depensesViewModel.get(depenseAt: indexPath.row) {
            self.depenseSelected = depense
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.depensesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "depenseCell", for: indexPath) as! DepenseCell2
        cell.nomDepLabel.text = self.depensesViewModel.get(depenseAt: indexPath.row)?.titre
        if let montantDouble = self.depensesViewModel.get(depenseAt: indexPath.row)?.titre{
            cell.montantLabel.text = String(montantDouble)
        }
        return cell
    }
}
