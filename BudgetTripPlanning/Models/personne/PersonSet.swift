//
//  PersonSet.swift
//  PersonList
//
//  Created by Alexis SANCHEZ01 (01) on 15/03/2019.
//  Copyright © 2019 Alexis SANCHEZ01. All rights reserved.
//

import Foundation

class PersonSet {
   
    fileprivate var personArray : [Person]
    
    init() {
        self.personArray = []
    }
    
    init(personArray: [Person]) {
        self.personArray = personArray
    }
    
    var  isEmpty : Bool {
        return self.personArray.isEmpty
    }
    
    func add(person: Person) {
        self.personArray.append(person)
    }
    
    func remove(person: Person) {
        if let index = self.personArray.index(of:person) {
            self.personArray.remove(at: index)
        }
    }
    
    var count : Int {
        return self.personArray.count
    }
    
    // Mark: Look
    
    func look(lastname: String) -> [Person] {
        let person = Person(firstname: "fsrdr", lastname: lastname)
        var personArray: [Person] = []
        for persons in self.personArray {
            if person == persons {
                personArray.append(persons)
            }
        }
        return personArray
    }
    
    func look(firstname: String) -> [Person] {
        let person = Person(firstname: firstname, lastname: "String")
        var personArray: [Person] = []
        for persons in self.personArray {
            if person.lastname == persons.lastname {
                personArray.append(persons)
            }
        }
        return personArray
    }
    
    func look(lastname: String, firstname: String) -> [Person] {
        let person = Person(firstname: firstname, lastname: lastname)
        var personArray: [Person] = []
        for persons in self.personArray {
            if person.lastname == persons.lastname && person.firstname == persons.firstname {
                personArray.append(persons)
            }
        }
        return personArray
    }

    func look(person: Person) -> Person? {
        var personC: Person?
        for persons in self.personArray {
            if person == persons {
                personC = persons
            }
        }
        return personC
    }

    func look(lastname: String, firstname: String, birthdate: Date?) -> Person? {
        var personC: Person?
        let personA = Person(firstname: firstname, lastname: lastname)
        personA.birthdate = birthdate
        for persons in self.personArray {
            if personA == persons {
                personC = persons
            }
        }
        return personC
    }
    
    // Mark: Contains
    
    func contains(person: Person) -> Bool {
        return self.personArray.contains(person)
    }
    
    func contains(firstname: String) -> Bool {
        var find: Bool = false
        for person in self.personArray {
            if person.firstname == firstname {
                find = true
            }
        }
        return find
    }
    
    func contains(lastname: String) -> Bool {
        var find: Bool = false
        for person in self.personArray {
            if person.lastname == lastname {
                find = true
            }
        }
        return find
    }
    
    func contains(lastname: String, firstname: String) -> Bool {
        var find: Bool = false
        for person in self.personArray {
            if person.lastname == lastname && person.firstname == firstname{
                find = true
            }
        }
        return find
    }
    
    func look(lastname: String, firstname: String, birthdate: Date?) -> Bool {
        
        let personA = Person(firstname: firstname, lastname: lastname)
        var find: Bool = false
        personA.birthdate = birthdate
        for persons in self.personArray {
            if personA == persons {
                find = true
            }
        }
        return find
    }
    
    func makeIterator() -> ItPersonSet {
        return ItPersonSet(self)
    }
    
    func getAt(index: Int) -> Person? {
        return self.personArray[index]
    }
}

class ItPersonSet {
    fileprivate var set : PersonSet
    fileprivate var currentInt : Int = 0
    
    fileprivate init(_ set: PersonSet){
        self.set = set
    }

    func reset() {
        self.currentInt = 0
    }
    
    func end() -> Bool {
        return self.currentInt >= self.set.personArray.count
    }
    
    func current() -> Person? {
        if end() {
            return nil
        }else{
            return self.set.personArray[currentInt]
        }
    }
    
    func next() -> Person? {
        self.currentInt = self.currentInt + 1
        if end() {
            return nil
        }
        else{
            return self.set.personArray[currentInt]
                        
        }
    }
    
    
    
}
