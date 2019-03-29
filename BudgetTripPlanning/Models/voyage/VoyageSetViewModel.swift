//
//  VoyageSetModel.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 22/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol VoyageSetViewModelDelegate {
    func dataSetChanged()
    func voyageDeleted(at indexPath: IndexPath)
    func voyageUpdated(at indexPath: IndexPath)
    func voyageAdded(at indexPath: IndexPath)
}

class VoyageSetViewModel {
    var delegate: VoyageSetViewModelDelegate? = nil
    var voyagesFetched: NSFetchedResultsController<Voyage>
    
    init(data: NSFetchedResultsController<Voyage>) {
        self.voyagesFetched = data
    }
    
    public func add(voyage: Voyage) {
        if let indexPath = self.voyagesFetched.indexPath(forObject: voyage) {
            self.delegate?.voyageAdded(at: indexPath)
        }
    }
    
    public var count : Int {
        return self.voyagesFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(voyageAt index: Int) -> Voyage?{
        return self.voyagesFetched.object(at: IndexPath(row: index, section: 0))
    }
    
    public func delete(voyage: Voyage) {
        if let indexPath = self.voyagesFetched.indexPath(forObject: voyage) {
            self.delegate?.voyageDeleted(at: indexPath)
        }
    }
    
}
