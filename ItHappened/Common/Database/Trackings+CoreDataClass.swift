import Foundation
import CoreData

@objc(Trackings)
public class Trackings: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Trackings"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
}
