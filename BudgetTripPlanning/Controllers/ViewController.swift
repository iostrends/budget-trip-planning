//
//  ViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var voyageTableController: VoyageTableViewController!
    @IBOutlet weak var voyageTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.voyageTableController = VoyageTableViewController(tableView: self.voyageTable)
    }


        
    }
    
    @IBAction func unwindToThisView(_ sender: UIStoryboardSegue) {
        if sender.identifier == "validerAddVoyage" {
            if let newVoyageController = sender.source as? VoyageCreationViewController {
                if let voyage = newVoyageController.newVoyage{
                    self.voyageTableController.voyagesViewModel.add(voyage: voyage)
                }
            }
        }
    }
}

