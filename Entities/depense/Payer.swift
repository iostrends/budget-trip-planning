//
//  Payer.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation

extension Payer {
    
    convenience init(personne: Personne, depense: Depense, montant: Double){
        self.init(context: CoreDataManager.context)
        self.personne = personne
        self.pmontant = montant
        self.depense = depense
    }
    
    public var montant : Double {
        get{
            return self.pmontant
        }
        set{
            self.pmontant = newValue
        }
    }
    
    public var personnePayer : Personne {
        get { return self.personne! }
    }
    
    public var depensePayer : Depense {
        get { return self.depense! }
    }
}
