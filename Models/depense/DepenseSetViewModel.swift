//
//  DepenseSetViewModel.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol DepenseSetViewModelDelegate {
    func dataSetChanged()
    func depenseDeleted(at indexPath: IndexPath)
    func depenseUpdated(at indexPath: IndexPath)
    func depenseAdded(at indexPath: IndexPath)
}

class DepenseSetViewModel {
    var delegate: DepenseSetViewModelDelegate? = nil
    var depensesFetched: NSFetchedResultsController<Depense>
    
    init(data: NSFetchedResultsController<Depense>) {
        self.depensesFetched = data
    }
    
    public func add(depense: Depense) {
        if let indexPath = self.depensesFetched.indexPath(forObject: depense) {
            self.delegate?.depenseAdded(at: indexPath)
        }
    }
    
    public var count : Int {
        return self.depensesFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(depenseAt index: Int) -> Depense?{
        return self.depensesFetched.object(at: IndexPath(row: index, section: 0))
    }
    
    public func delete(depense: Depense) {
        if let indexPath = self.depensesFetched.indexPath(forObject: depense) {
            self.delegate?.depenseDeleted(at: indexPath)
        }
    }
}
