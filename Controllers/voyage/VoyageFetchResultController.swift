//
//  VoyageFetchedResultController.swift
//  BudgetTripPlanning
//
//  Created by Alexis SANCHEZ01 (01) on 26/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01 (01). All rights reserved.
//

import Foundation
import CoreData
import UIKit

class VoyageFetchResultController: NSObject, NSFetchedResultsControllerDelegate {
    let tableView : UITableView
    
    init(view: UITableView) {
        self.tableView = view
        super.init()
        do{
            try self.voyagesFetched.performFetch()
        }catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    lazy var voyagesFetched : NSFetchedResultsController<Voyage> = {
        let request : NSFetchRequest<Voyage> = Voyage.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Voyage.nom), ascending:true), NSSortDescriptor(key:#keyPath(Voyage.datedepart), ascending:true)]
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
