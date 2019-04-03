//
//  VoyageDetailsViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis Sanchez on 02/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class VoyageDetailsViewController: UIViewController {
    
    @IBOutlet weak var photoVoyage: UIImageView!
    @IBOutlet weak var nomVoyage: UILabel!
    @IBOutlet weak var dateDebut: UILabel!
    @IBOutlet weak var dateFin: UILabel!
    @IBOutlet weak var tablePersonne: UITableView!
    
    var voyage : Voyage?
    var personneTableViewController: PersonneTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nomVoyage.text = self.voyage?.nom
        if let data = self.voyage?.photo {
            self.photoVoyage.image = UIImage(data: data)
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        if let date = self.voyage?.dateDebut {
            let dateString = formatter.string(from: date)
            self.dateDebut.text = dateString
        }
        if let date = self.voyage?.dateDebut {
            let dateString = formatter.string(from: date)
            self.dateFin.text = dateString
        }
        self.personneTableViewController = PersonneTableViewController(tableView: self.tablePersonne, voyage: voyage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewPersonSegue"{
            if let vc = segue.destination as? PersonneAjoutViewController{
                vc.voyage = self.voyage
            }
        }else if segue.identifier == "showDetailsPersonne" {
            if let vc = segue.destination as? PersonneDetailsViewController{
                vc.personne = self.personneTableViewController.personneSelected
            }
        }
    }
    
    @IBAction func unwindToVoyageDetails(_ sender: UIStoryboardSegue) {
        if sender.identifier == "okAddPersonneVoyage" {
            if let personneAjoutViewController = sender.source as? PersonneAjoutViewController {
                if let personne = personneAjoutViewController.personne{
                    self.personneTableViewController.personnesViewModel.add(personne: personne)
                }
            }
        }
    }
}
