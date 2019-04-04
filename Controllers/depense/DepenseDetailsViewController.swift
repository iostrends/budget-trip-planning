//
//  DepenseDetailsViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 02/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class DepenseDetailsViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableviewPersonnesDepense: UITableView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var montant: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var titre: UILabel!
    
    var depense : Depense!
    var personnesDepenseTableViewController : PersonnesDepenseTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        montant.text = String(depense.montant)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        date.text = formatter.string(from: depense.dateDepense!)
       
        let data = self.depense.photoDepense
        self.image.image = UIImage(data: data)
        titre.text = depense.titre
        
       
        self.personnesDepenseTableViewController = PersonnesDepenseTableViewController(tableView: self.tableviewPersonnesDepense, depense: depense)
    }
    
}
