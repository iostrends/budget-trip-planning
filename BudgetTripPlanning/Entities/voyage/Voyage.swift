//
//  Voyage.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit

class Voyage {
    var nomVoyage : String
    var dateDebut : Date
    var dateFin : Date
    var photo : UIImage
    
    init(nomVoyage: String, dateDebut: Date, dateFin: Date, photo: UIImage) {
        self.nomVoyage = nomVoyage
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.photo = photo
    }
}
