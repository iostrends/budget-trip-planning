//
//  VoyageDAO.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import CoreData

class VoyageData {
    static let request : NSFFetchRequest<Voyage> = Voyage.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func delete()
}
