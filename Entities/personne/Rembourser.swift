//
//  Rembourser.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation

extension Rembourser{
    
    convenience init(rembourse : Personne,rembourseur : Personne, montant: Double){
    self.init(context: CoreDataManager.context)
    self.rembourse = rembourse
    self.rembourseur = rembourseur
    self.pmontant = montant
}

public var leRembourse : Personne {
    get{
       return self.rembourse!
    }
    set{
        self.rembourse = newValue
    }
     }
public var leRembourseur : Personne {
    get{
        return self.rembourseur!
    }
    set{
        self.rembourseur = newValue
    }
}

public var montant : Double {
    get{
        return self.pmontant
    }
    set{
        self.pmontant = newValue
    }
}
}
