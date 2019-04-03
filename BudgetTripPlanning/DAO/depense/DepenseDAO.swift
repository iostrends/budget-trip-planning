//
//  DepenseDAO.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import CoreData

class DepenseDAO {
    static let request : NSFetchRequest<Depense> = Depense.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func delete(depense: Depense) {
        CoreDataManager.context.delete(depense)
    }
    
    static func fetchByPersonne(personne: Personne) ->[Depense]?{
        var depenses : [Depense] = []
        if let payes = PayerDAO.fetchByPersonne(personne: personne){
            for paye in payes{
                depenses.append(paye.depense!)
            }
            
        }
   return depenses
    }
    
    static func fetchByVoyage(voyage: Voyage) ->[Depense]?{
        return voyage.depenses
    }
    
    static func getTotalDepensePersonne(personne: Personne) -> Double {
        var montant = 0.0
        if let depenses = self.fetchByPersonne(personne: personne) {
            for depense in  depenses {
                montant = montant + depense.montant
            }
        }
        return montant
    }
    
    static func getTotalDepenseVoyage(voyage: Voyage) -> Double {
        var montant = 0.0
        if let depenses = self.fetchByVoyage(voyage: voyage) {
            for depense in  depenses {
                montant = montant + depense.montant
            }
        }
        return montant
    }
    
    
}
