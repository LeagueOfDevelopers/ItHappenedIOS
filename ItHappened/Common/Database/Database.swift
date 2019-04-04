import SQLite

class Database {
    let fileName = "database.sqlite"
    var database: OpaquePointer?
    
    func createTable(){
        var createTableStatement: OpaquePointer? = nil
        
        let databaseUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.fileName)
        
        sqlite3_open(databaseUrl.path, &database)
        
        let createTableStatementString = "CREATE TABLE IF NOT EXISTS trackings (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, scaleName TEXT, scale TEXT, rating TEXT, comment TEXT, dateOfChange TEXT, isDeleted INTEGER, color TEXT);"
        
        if sqlite3_prepare_v2(database, createTableStatementString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Trackings table created.")
            } else {
                print("Trackings table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
        
    }
    
    func insert(tracking: Tracking) {
        var insertStatement: OpaquePointer? = nil
        let insertStatementString = "INSERT INTO trackings (name, dateOfChange, scaleName, scale, rating, comment, isDeleted, color) VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
        if sqlite3_prepare_v2(database, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let name = tracking.trackingName as NSString
            let date = tracking.getStringDate() as NSString
            let scaleName = tracking.scaleName as NSString
            let scale = tracking.scale.rawValue as NSString
            let rating = tracking.rating.rawValue as NSString
            let comment = tracking.comment.rawValue as NSString
            var isDeleted: Int32 = 0
            if tracking.isDeleted == true{
                isDeleted = 1
            }
            let color = tracking.color as NSString
            sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, date.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, scaleName.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, scale.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, rating.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, comment.utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 7, isDeleted)
            sqlite3_bind_text(insertStatement, 8, color.utf8String, -1 ,nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func queryAllRows() -> [Tracking] {
        let queryStatementString = "SELECT * FROM trackings;"
        var trackings = [Tracking]()
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {

            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                let id = sqlite3_column_int(queryStatement, 0)
                let name = sqlite3_column_text(queryStatement, 1)
                let date = sqlite3_column_text(queryStatement, 6)
                let dateString = String(cString: date!)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let dateFromDateFormatter = dateFormatter.date(from: dateString)
                let scaleName = sqlite3_column_text(queryStatement, 2)
                let scale = sqlite3_column_text(queryStatement, 3)
                let rating = sqlite3_column_text(queryStatement, 4)
                let comment = sqlite3_column_text(queryStatement, 5)
                print(String(cString: comment!))
                let isDeleted = sqlite3_column_int(queryStatement, 7)
                var isDeletedBool = false
                if Int(isDeleted) == 1{
                    isDeletedBool = true
                }
                let color = sqlite3_column_text(queryStatement, 8)
                let tracking = Tracking(scaleName: String(cString: scaleName!), trackingName: String(cString: name!), id: Int(id), scale: TrackingCustomization(rawValue: String(cString: scale!))!, rating: TrackingCustomization(rawValue: String(cString: rating!))!, comment: TrackingCustomization(rawValue: String(cString: comment!))!, eventCollection: [], dateOfChange: dateFromDateFormatter!, isDeleted: isDeletedBool, color: String(cString: color!))
                trackings.append(tracking)
            }

        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return trackings
    }
    
    func deleteAllRows() {
        let deleteStatementString = "DELETE FROM trackings"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func checkTableIsEmpty() -> Bool{
        let queryStatementString = "SELECT * FROM trackings;"
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if(sqlite3_step(queryStatement) != SQLITE_ROW) {
                sqlite3_finalize(queryStatement)
                return false
            }
        }
        sqlite3_finalize(queryStatement)
        return true
    }
    
}
