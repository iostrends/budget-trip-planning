//
//  Personne.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 29/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation

extension Personne {
    
    convenience init(nom: String, dateDepart: Date, dateArrivee: Date){
        self.init(context: CoreDataManager.context)
        self.pnom = nom
        self.pdateDepart = dateDepart
        self.pdateArrivee = dateArrivee
    }
    
    public var nom : String { return self.pnom ?? "" }
    public var dateDepart : Date {
        get{
            return self.pdateDepart!
        }
        set{
            self.pdateDepart = newValue
        }
    }
    public var dateArrivee : Date {
        get{
            return self.pdateArrivee!
        }
        set{
            self.pdateDepart = newValue
        }
    }

}
