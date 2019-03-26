//
//  Voyage.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation

extension Voyage {
    
    convenience init(nom: String, depart: Date, fin: Date, photo: Data? = nil){
        self.init(context: CoreDataManager.context)
        self.pnom = nom
        self.pdatedepart = depart
        self.pdatefin = fin
        self.pphoto = photo
    }
    
    public var nom : String { return self.pnom ?? "" }
    public var dateDebut : Date {
        get{
            return self.pdatedepart!
        }
        set{
            self.pdatedepart = newValue
        }
    }
    public var dateFin : Date {
        get{
            return self.pdatefin!
        }
        set{
            self.pdatedepart = newValue
        }
    }
    public var photo : Data? {
        get{
            return self.pphoto
        }
        set{
            self.pphoto = newValue
        }
    }
}
