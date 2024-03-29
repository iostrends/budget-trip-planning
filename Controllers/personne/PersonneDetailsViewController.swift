//
//  PersonneDetailsViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 02/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class PersonneDetailsViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var nomPersonne: UILabel!
    @IBOutlet weak var dateArrivee: UILabel!
    @IBOutlet weak var dateDepart: UILabel!
    @IBOutlet weak var montantDepense: UILabel!
    @IBOutlet weak var tableDepense: UITableView!
    
    var depenseTableViewController : DepensePersonnesDetailsTableController!
    var personne : Personne?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nomPersonne.text = self.personne?.nom
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        if let date = self.personne?.dateArrivee {
            let dateString = formatter.string(from: date)
            self.dateArrivee.text = dateString
        }
        if let date = self.personne?.dateDepart {
            let dateString = formatter.string(from: date)
            self.dateDepart.text = dateString
        }
        self.montantDepense.text = String(PayerDAO.getTotalMontantPayePersonne(personne: personne!))
        self.depenseTableViewController = DepensePersonnesDetailsTableController(tableView: self.tableDepense, personne: self.personne!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "detailsDepense" {
            if let vc = segue.destination as? DepenseDetailsViewController {
                vc.depense = self.depenseTableViewController.depenseSelected
            }
        }
    }
}
