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
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
