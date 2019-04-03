//
//  Depense.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation

extension Depense {
    
    convenience init(titre: String, montant: Double, dateDepense: Date? = nil, photoDepense: Data){
        self.init(context: CoreDataManager.context)
        self.ptitre = titre
        self.pmontant = montant
        self.pdate = dateDepense
        self.pphoto = photoDepense
    }
    
    convenience init() {
        self.init(context: CoreDataManager.context)
    }
    
    public var titre : String { return self.ptitre ?? "" }
    public var dateDepense : Date? {
        get{
            return self.pdate
        }
        set{
            self.pdate = newValue
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
    public var voyage : Voyage{
        get { return self.concernerV! }
    }
    public var personnes : [Personne] {
        get {
            let set = self.payeurs
            return set?.allObjects as! [Personne]
        }
    }
}
