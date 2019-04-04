//
//  EquilibreViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class EquilibreViewController: UIViewController, UINavigationControllerDelegate {
    
    var currentVoyage : Voyage!
    var equilibrePersonnesTableViewController : EquilibrePersonnesTableViewController!
    
    @IBOutlet weak var tableViewEquilibrePersonne: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.equilibrePersonnesTableViewController = EquilibrePersonnesTableViewController(tableView: tableViewEquilibrePersonne, voyage: currentVoyage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDepense"{
            if let vc = segue.destination as? PersonneAjoutViewController{
                vc.voyage = self.currentVoyage
            }
        }
    }
}
