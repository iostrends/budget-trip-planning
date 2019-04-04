//
//  DepenseVoyageViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class DepenseVoyageViewController: UIViewController {
    
    @IBOutlet weak var montantTotalLabel: UILabel!
    @IBOutlet weak var tableDepenses: UITableView!
    
    var currentVoyaye : Voyage!
    var depenseTableViewController : DepenseTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.depenseTableViewController = DepenseTableViewController(tableView: tableDepenses, voyage: currentVoyaye)
        self.montantTotalLabel.text = String(self.depenseTableViewController.depensesViewModel.getMontantTotal())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDepense" {
            if let vc = segue.destination as? DepenseCreationViewController {
                vc.currentVoyage = currentVoyaye
            }
        }
        else if segue.identifier == "detailsDepense" {
            if let vc = segue.destination as? DepenseDetailsViewController {
                vc.depense = self.depenseTableViewController.depenseSelected
            }
        }
    }
    
    @IBAction func unwindToVoyageDetails(_ sender: UIStoryboardSegue) {
        if sender.identifier == "validerCreationDepense" {
            if let vc = sender.source as? DepenseCreationViewController {
                if let depense = vc.newDepense{
                    self.depenseTableViewController.depensesViewModel.add(depense: depense)
                }
            }
        }
    }
}
