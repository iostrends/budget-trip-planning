//
//  DepenseCreationViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 02/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class DepenseCreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titreDepense: UITextField!
    @IBOutlet weak var montantDepense: UITextField!
    @IBOutlet weak var dateDepense: UIDatePicker!
    @IBOutlet weak var photoDepense: UIImageView!
    @IBOutlet weak var photoPicker: UIButton!
    @IBOutlet weak var btnSelectAll: UIButton!
    @IBOutlet weak var tablePersonne: UITableView!
    
    var currentVoyage : Voyage!
    var newDepense : Depense?
    var depensePersonneViewControoler: DepensePersonnesTableViewController!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.newDepense = Depense()
        self.depensePersonneViewControoler = DepensePersonnesTableViewController(tableView: tablePersonne, voyage: currentVoyage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "validerCreationDepense" {
            let titre : String = self.titreDepense.text!
            let montant : String = self.montantDepense.text!
            let dateDepense : Date = self.dateDepense.date
            let image : UIImage = self.photoDepense.image!
            
            if let montantDouble = Double(montant){
                self.newDepense!.montant = montantDouble
            }
            self.newDepense!.ptitre = titre
            self.newDepense!.dateDepense = dateDepense
            self.newDepense!.pphoto = image.pngData()
            
            var personnesDepenses : [(Personne, String)] = []
            personnesDepenses = self.depensePersonneViewControoler.getAllPersonsSelected()
            
            for personne in personnesDepenses {
                var payer : Payer
                if let montantDouble = Double(personne.1){
                    payer = Payer(personne: personne.0, depense: newDepense!, montant: montantDouble)                    
                    self.newDepense!.addToPayeurs(payer)
                }
            }
            
        }
    }
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        photoDepense.image = image
    }
}
