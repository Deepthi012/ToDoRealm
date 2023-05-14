//
//  DatabaseHelper.swift
//  ToDoappRealm
//
//  Created by West Agile Labs on 12/05/23.
//
import RealmSwift
import Foundation

class DatabaseHelper{
    static let shared = DatabaseHelper()
    
    private var realm = try! Realm()
    
    func getDatabaseUrl() -> URL?{
        return Realm.Configuration.defaultConfiguration.fileURL
    
    }
    
    func saveContact(contact: Contact){
        try! realm.write{
            realm.add(contact)
        }
        
        
    }
    func updateContact(oldContact: Contact, newContact: Contact){
        try! realm.write{
            oldContact.firstname = newContact.firstname
            oldContact.lastname = newContact.lastname
        }
    }
    func deleteContact(contact:Contact){
        try! realm.write{
            realm.delete(contact)
        }
    }
    func getAllContacts() -> [Contact]{
        return Array(realm.objects(Contact.self))
    }
}
