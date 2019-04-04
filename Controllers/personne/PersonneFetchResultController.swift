//
//  PersonneFetchResultController.swift
//  BudgetTripPlanning
//
//  Created by Alexis LUANGPRASEUTH on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//


import Foundation
import CoreData
import UIKit

class PersonneFetchResultController: NSObject, NSFetchedResultsControllerDelegate {
    let tableView : UITableView
    var voyage : Voyage?
    var depense : Depense?
    
    init(view: UITableView, leVoyage: Voyage?) {
        self.tableView = view
        super.init()
        do{
            self.voyage = leVoyage
            try self.personnesFetched.performFetch()
        }catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    init(view: UITableView, depense: Depense?) {
        self.tableView = view
        super.init()
        do{
            self.depense = depense
            try self.personnesDepenseFetched.performFetch()
        }catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    lazy var personnesFetched : NSFetchedResultsController<Personne> = {
        let request : NSFetchRequest<Personne> = Personne.fetchRequest()
        if let leVoyage = voyage{
        request.predicate = NSPredicate(format: "participer == %@", leVoyage)
        }
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Personne.pnom), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        return fetchResultController
    }()
    
    lazy var personnesDepenseFetched : NSFetchedResultsController<Personne> = {
        let request : NSFetchRequest<Personne> = Personne.fetchRequest()
        if let laDepense = depense{
            request.predicate = NSPredicate(format: "ANY payer.depense == %@", laDepense)
        }
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Personne.pnom), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        return fetchResultController
    }()
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
        CoreDataManager.save()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        default:
            break
        }
    }
}
