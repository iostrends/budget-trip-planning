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
}
