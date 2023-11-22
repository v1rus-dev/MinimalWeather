//
//  Persistence.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 14.11.23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for index in 0..<10 {
            let newCity = City(context: viewContext)
            newCity.name = "Minsk \(index)"
            newCity.id = Int64(index)
            newCity.country_code = "BY"
            newCity.country_id = Int16(234)
            newCity.lat = 23.34242
            newCity.lon = 56.3563
            newCity.state_code = "State123"
            newCity.state_id = Int16(12)
            
            let newCountry = Country(context: viewContext)
            newCountry.id = Int32(index)
            newCountry.name = "Minsk \(index)"
            newCountry.ios2 = "index\(index)"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer
    
    func isEmpty(entityName: String) -> Bool {
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let count = try container.viewContext.count(for: fetchReq)
            return count == 0
        } catch {
            print("Error counting objects: \(error)")
            return false
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        container.viewContext
    }
    
    func saveChangesByContext(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Error save changes")
        }
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MinimalWeather")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
