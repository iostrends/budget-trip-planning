//
//  PayerDAO.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import CoreData

class PayerDAO {
    static let request : NSFetchRequest<Payer> = Payer.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    
    
    static func fetchByPersonne(personne: Personne) ->[Payer]?{
        
        if let set : NSSet = personne.payer {
        return set.allObjects as? [Payer]
        }
        else{
            return nil
        }
    }
    
    static func fetchByDepense(depense: Depense) ->[Payer]?{
        if let set : NSSet = depense.payeurs {
            return set.allObjects as? [Payer]
        }
        else {
            return nil
        }
    }
    
    static func getTotalMontantPayePersonne(personne: Personne) -> Double {
        var montant = 0.0
        if let payes = self.fetchByPersonne(personne: personne) {
            for paye in  payes {
                montant = montant + paye.montant
            }
        }
        return montant
    }
    
    static func getnbPayeursDepense(depenses: Depense) -> Int {
        var nbPayeurs: Int = 0
        if let payes = self.fetchByDepense(depense: depenses) {
           nbPayeurs = payes.count
        }
        return nbPayeurs
    }
    
    
}
