//
//  PersonnesDepenseTableViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 04/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class PersonnesDepenseTableViewController: NSObject, PersonneSetViewModelDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var personneTableView : UITableView
    var personnesViewModel : PersonneSetViewModel
    let fetchResultController : PersonneFetchResultController
    var personneSelected : Personne?
    var depense : Depense?
    init(tableView: UITableView, depense : Depense?) {
        self.personneTableView = tableView
        self.fetchResultController = PersonneFetchResultController(view : tableView, depense : depense)
        self.depense = depense
        self.personnesViewModel = PersonneSetViewModel(data: self.fetchResultController.personnesDepenseFetched)
        super.init()
        self.personneTableView.dataSource = self
        self.personneTableView.delegate = self
        self.personnesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personnesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personneCell", for: indexPath) as! PersonneDepenseCell
        var montant : Double = 0
        let personne : Personne = self.personnesViewModel.get(personneAt: indexPath.row)!
        cell.nom.text = personne.nom
        let payeurs = PayerDAO.fetchByDepense(depense: depense!)
        for payeur in payeurs!{
            if payeur.personne == personne {
                montant = payeur.montant
            }
        }
        cell.montant.text = String(montant)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let personne = self.personnesViewModel.get(personneAt: indexPath.row) {
            self.personneSelected = personne
        }
        return indexPath
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
