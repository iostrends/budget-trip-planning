//
//  PersonneSetViewModel.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol PersonneSetViewModelDelegate {
    func dataSetChanged()
    func personneDeleted(at indexPath: IndexPath)
    func personneUpdated(at indexPath: IndexPath)
    func personneAdded(at indexPath: IndexPath)
}

class PersonneSetViewModel {
    var delegate: PersonneSetViewModelDelegate? = nil
    var personnesFetched: NSFetchedResultsController<Personne>
    
    init(data: NSFetchedResultsController<Personne>) {
        self.personnesFetched = data
    }
    
    public func add(personne: Personne) {
        if let indexPath = self.personnesFetched.indexPath(forObject: personne) {
            self.delegate?.personneAdded(at: indexPath)
        }
    }
    
    public var count : Int {
        return self.personnesFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(personneAt index: Int) -> Personne?{
        return self.personnesFetched.object(at: IndexPath(row: index, section: 0))
    }
}
