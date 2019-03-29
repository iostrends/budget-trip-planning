//
//  PersonneAjoutViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class PersonneAjoutViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var nomPersonne: UITextField!
    @IBOutlet weak var dateArrivee: UIDatePicker!
    @IBOutlet weak var dateDepart: UIDatePicker!
    var personne : Personne?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "okAddPersonneVoyage" {
            let nom : String = self.nomPersonne.text!
            let dateDepart : Date = self.dateDepart.date
            let dateArrivee : Date = self.dateArrivee.date
            
            self.personne = Personne(nom: nom, dateDepart: dateDepart, dateArrivee: dateArrivee)
            
        }else{
            self.personne = nil
        }
    }
}
