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
    //var voyagesFetched: NSFFecthedResultsController<Voyage>
    
    //init(data: NSFFecthedResultsController<Voyage>) {
        //self.voyagesFetched = data
    //}
    
    private var voyagesSet = VoyageSet()
    var voyages : [Voyage] = []
    init() {
        guard let appDelegate = UIApplication.shared.delegate else {
            fatalError()
        }
        self.voyagesSet = (appDelegate as! AppDelegate).voyagesSet
        let it = voyagesSet.makeIterator()
        while !it.end() {
            if let voyage = it.current() {
                voyages.append(voyage)
            }
            it.next()
        }
    }
    
    public var count : Int {
        return self.voyagesSet.count
    }
}
