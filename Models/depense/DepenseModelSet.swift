//
//  DepenseModelSet.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 03/04/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation

class DepenseModelSet {
    
    var depenseArray : [Depense] = []
    
    init(personne: Personne) {
        if let depenses = DepenseDAO.fetchByPersonne(personne: personne) {
            self.depenseArray = depenses
        }
    }
    
    init(voyage: Voyage) {
        if let depenses = DepenseDAO.fetchByVoyage(voyage: voyage) {
            self.depenseArray = depenses
        }
    }
    
    var  isEmpty : Bool {
        return self.depenseArray.isEmpty
    }
    
    func add(depense: Depense) {
        self.depenseArray.append(depense)
    }
    
    func remove(depense: Depense) {
        if let index = self.depenseArray.index(of:depense) {
            self.depenseArray.remove(at: index)
        }
    }
    
    var count : Int {
        return self.depenseArray.count
    }
    
    func makeIterator() -> ItDepenseSet {
        return ItDepenseSet(self)
    }
    
    func getAt(index: Int) -> Depense? {
        return self.depenseArray[index]
    }
}

class ItDepenseSet {
    fileprivate var set : DepenseModelSet
    fileprivate var currentInt : Int = 0
    
    fileprivate init(_ set: DepenseModelSet){
        self.set = set
    }
    
    func reset() {
        self.currentInt = 0
    }
    
    func end() -> Bool {
        return self.currentInt >= self.set.depenseArray.count
    }
    
    func current() -> Depense? {
        if end() {
            return nil
        }else{
            return self.set.depenseArray[currentInt]
        }
    }
    
    func next() -> Depense? {
        self.currentInt = self.currentInt + 1
        if end() {
            return nil
        }
        else{
            return self.set.depenseArray[currentInt]
            
        }
    }
}
