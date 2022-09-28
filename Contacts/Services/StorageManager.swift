//
//  StorageManager.swift
//  Contacts
//
//  Created by packovv on 24.09.2022.
//

import CoreData

final class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ContactEntity")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistentContainer.viewContext
    }
    
    // MARK: - Public Methods
    func fetchData(completion: (Result<[ContactEntity], Error>) -> Void)  {
        let fetchRequest = ContactEntity.fetchRequest()
        
        do {
            let entities = try viewContext.fetch(fetchRequest)
            completion(.success(entities))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func save(name: String, surname: String, email: String, phone: String, completion: (ContactEntity) -> Void) {
        let entity = ContactEntity(context: viewContext)
        entity.name = name
        entity.surname = surname
        entity.email = email
        entity.phone = phone
        completion(entity)
        saveContext()
    }
    
    func edit(_ entity: ContactEntity, newName: String?, newSurname: String?, newEmail: String?, newPhone: String?) {
        entity.name = newName
        entity.surname = newSurname
        entity.email = newEmail
        entity.phone = newPhone
        saveContext()
    }
    
    func delete(_ entity: ContactEntity) {
        viewContext.delete(entity)
        saveContext()
    }

    // MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
