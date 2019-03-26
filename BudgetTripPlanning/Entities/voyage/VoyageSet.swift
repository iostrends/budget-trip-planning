//
//  VoyageSet.swift
//  PersonList
//
//  Created by Alexis SANCHEZ01 (01) on 15/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01. All rights reserved.
//

import Foundation

class VoyageSet {
   
    fileprivate var voyageArray : [Voyage]
    
    init() {
        self.voyageArray = []
    }
    
    init(voyageArray: [Voyage]) {
        self.voyageArray = voyageArray
    }
    
    func isEmpty() -> Bool {
        return self.voyageArray.isEmpty
    }
    
    func add(voyage: Voyage) {
        self.voyageArray.append(voyage)
    }
    
    var count : Int {
        return self.voyageArray.count
    }

    func makeIterator() -> ItVoyageSet {
        return ItVoyageSet(self)
    }
}

class ItVoyageSet {
    fileprivate var set : VoyageSet
    fileprivate var currentInt : Int = 0
    
    fileprivate init(_ set: VoyageSet){
        self.set = set
    }

    func reset() {
        self.currentInt = 0
    }
    
    func end() -> Bool {
        return self.currentInt >= self.set.voyageArray.count
    }
    
    func current() -> Voyage? {
        if end() {
            return nil
        }else{
            return self.set.voyageArray[currentInt]
        }
    }
    
    func next() -> Voyage? {
        self.currentInt = self.currentInt + 1
        if end() {
            return nil
        }
        else{
            return self.set.voyageArray[currentInt]
                        
        }
    }    
}
