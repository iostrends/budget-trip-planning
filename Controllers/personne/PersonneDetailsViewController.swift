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
    
    var personne : Personne?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
