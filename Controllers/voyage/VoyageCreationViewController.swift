//
//  VoyageCreationController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class VoyageCreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nomVoyage: UITextField!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var dateFin: UIDatePicker!
    @IBOutlet weak var dateDebut: UIDatePicker!
    @IBOutlet weak var tableviewPersonne: UITableView!
    
    var personneTableViewController: PersonneTableViewController!
    let imagePicker = UIImagePickerController()
    var newVoyage : Voyage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.newVoyage = Voyage(nom: "nouveau voyage ")
        self.personneTableViewController = PersonneTableViewController(tableView: self.tableviewPersonne, voyage: newVoyage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "validerAddVoyage" {
            let nomVoyage : String = self.nomVoyage.text!
            let dateFin : Date = self.dateFin.date
            let dateDebut : Date = self.dateDebut.date
            let image : UIImage = self.imageDisplay.image!
            
            self.newVoyage!.pnom = nomVoyage
            self.newVoyage!.dateDebut = dateDebut
            self.newVoyage!.dateFin = dateFin
            self.newVoyage!.photo = image.pngData()
        }
        else if segue.identifier == "addNewPersonSegue"{
            if let vc = segue.destination as? PersonneAjoutViewController{
                vc.voyage = self.newVoyage
            }
        }else if segue.identifier == "cancelAddVoyage" {
            CoreDataManager.context.delete(self.newVoyage)
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
        imageDisplay.image = image
    }
    
    @IBAction func unwindFromPersonneCreation(_ sender: UIStoryboardSegue) {
        if sender.identifier == "okAddPersonneVoyage" {
            if let personneAjoutViewController = sender.source as? PersonneAjoutViewController {
                if let personne = personneAjoutViewController.personne{
                    self.newVoyage = personneAjoutViewController.voyage
                    self.personneTableViewController.personnesViewModel.add(personne: personne)                   
                }
            }
        }
    }
}
