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

class PersonneTableViewController: NSObject, PersonneSetViewModelDelegate, UITableViewDataSource {
    
    var personneTableView : UITableView
    var personnesViewModel : PersonneSetViewModel
    let fetchResultController : PersonneFetchResultController
    
    init(tableView: UITableView, voyage : Voyage?) {
        self.personneTableView = tableView
        self.fetchResultController = PersonneFetchResultController(view : tableView, leVoyage : voyage)
        self.personnesViewModel = PersonneSetViewModel(data: self.fetchResultController.personnesFetched)
        super.init()
        self.personneTableView.dataSource = self
        self.personnesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personnesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personneCell", for: indexPath)
        cell.textLabel?.text = self.personnesViewModel.get(personneAt: indexPath.row)?.pnom
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if let personne = self.personnesViewModel.get(personneAt: indexPath.row) {
                CoreDataManager.context.delete(personne)
                self.personnesViewModel.delete(personne: personne)
            }
        }
    }
    
    func dataSetChanged() {
        self.personneTableView.reloadData()
    }
    
    func personneDeleted(at indexPath: IndexPath) {
        self.personneTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personneUpdated(at indexPath: IndexPath) {
        
        self.personneTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personneAdded(at indexPath: IndexPath) {
       // dataSetChanged()
        self.personneTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
}
