//
//  EquilibrePersonnesTableViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class EquilibrePersonnesTableViewController: NSObject, PersonneSetViewModelDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var equilibrePersonneTableView : UITableView
    var personnesViewModel : PersonneSetViewModel
    let fetchResultController : PersonneFetchResultController
    var personneSelected : Personne?
    
    init(tableView: UITableView, voyage : Voyage?) {
        self.equilibrePersonneTableView = tableView
        self.fetchResultController = PersonneFetchResultController(view : tableView, leVoyage : voyage)
        self.personnesViewModel = PersonneSetViewModel(data: self.fetchResultController.personnesFetched)
        super.init()
        self.equilibrePersonneTableView.dataSource = self
        self.equilibrePersonneTableView.delegate = self
        self.personnesViewModel.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personnesViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personneCell", for: indexPath) as! EquilibrePersonneCell
        let personne : Personne = self.personnesViewModel.get(personneAt: indexPath.row)!
        cell.nom.text = personne.nom
        var balance : Double = 0
        let montantPaye : Double = PayerDAO.getTotalMontantPayePersonne(personne: personne)
        var montantapayer : Double = 0
        if let depenses : [Depense] = DepenseDAO.fetchByPersonne(personne: personne){
        for depense in depenses{
            let nbPayeurs : Int = PayerDAO.getnbPayeursDepense(depenses: depense)
            let montantDepense : Double = depense.montant
            montantapayer = montantapayer + (montantDepense/Double(nbPayeurs))
        }
        balance = montantPaye - montantapayer
        }
        cell.balance.text = String(balance)
        
        
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
        self.equilibrePersonneTableView.reloadData()
    }
    
    func personneDeleted(at indexPath: IndexPath) {
        self.equilibrePersonneTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personneUpdated(at indexPath: IndexPath) {
        
        self.equilibrePersonneTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personneAdded(at indexPath: IndexPath) {
        // dataSetChanged()
        self.equilibrePersonneTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
}
