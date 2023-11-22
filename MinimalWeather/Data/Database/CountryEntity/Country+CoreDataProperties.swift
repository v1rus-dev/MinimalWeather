//
//  Country+CoreDataProperties.swift
//  MinimalWeather
//
//  Created by Yegor Cheprasov on 21.11.23.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var id: Int32
    @NSManaged public var ios2: String?
    @NSManaged public var name: String?

}

extension Country : Identifiable {

}
