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
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
}
