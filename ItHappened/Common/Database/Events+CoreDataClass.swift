import Foundation
import CoreData

@objc(Events)
public class Events: NSManagedObject {

    convenience init(){
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Events"), insertInto: CoreDataManager.instance.persistentContainer.viewContext)
    }
    
    
}
