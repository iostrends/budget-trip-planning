//
//  ViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var voyageTableController: VoyageTableController!
    @IBOutlet weak var voyageTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.voyageTableController = VoyageTableController(tableView: self.voyageTable)
    }

    @IBAction func unwindToThisView(_ unwindSegue: UIStoryboardSegue) {
        return
    }
}

