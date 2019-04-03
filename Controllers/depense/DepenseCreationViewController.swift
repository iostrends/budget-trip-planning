//
//  DepenseCreationViewController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 02/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class DepenseCreationViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var titreDepense: UITextField!
    @IBOutlet weak var montantDepense: UITextField!
    @IBOutlet weak var dateDepense: UIDatePicker!
    @IBOutlet weak var photoDepense: UIImageView!
    @IBOutlet weak var photoPicker: UIButton!
    @IBOutlet weak var btnSelectAll: UIButton!
    @IBOutlet weak var tablePersonne: UITableView!
    
    var currentVoyage : Voyage!
    var personneTableViewController: PersonneTableViewController!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.personneTableViewController = PersonneTableViewController(tableView: tablePersonne, voyage: currentVoyage)
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
        photoDepense.image = image
    }
}
