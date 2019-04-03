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
    private let modelSet : DepenseModelSet
    var depenses: [Depense] = []
    var delegate: DepenseSetViewModelDelegate? = nil
    
    init(personne: Personne) {
        self.modelSet = DepenseModelSet(personne: personne)
        let it = modelSet.makeIterator()
        while !it.end() {
            if let depense = it.current() {
                self.depenses.append(depense)
            }
            it.next()
        }
    }
    
    init(voyage: Voyage) {
        self.modelSet = DepenseModelSet(voyage: voyage)
        let it = modelSet.makeIterator()
        while !it.end() {
            if let depense = it.current() {
                self.depenses.append(depense)
            }
            it.next()
        }
    }
    
    public func add(depense: Depense) {
        self.modelSet.add(depense: depense)
        self.depenses.append(depense)
        self.delegate?.depenseAdded(at: IndexPath(row:self.modelSet.count-1,section:0))
    }
    
    public var count : Int {
        return self.depenses.count
    }
    
    public func get(depenseAt index: Int) -> Depense?{
        guard (index >= 0) && (index < self.count) else { return nil}
        return self.depenses[index]
    }
    
    public func getMontantTotal() -> Double {
        var montant : Double = 0.0
        for depense in depenses {
            montant = montant + depense.montant
        }
        return montant
    }
}
