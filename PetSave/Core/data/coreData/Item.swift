//
// Created by Simon Rofe on 26/5/22.
//

import CoreData

@objc(Item)
class Item: NSManagedObject {
    @NSManaged public var timestamp: Date?
}

extension Item {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        NSFetchRequest<Item>(entityName: "Item")
    }
}
