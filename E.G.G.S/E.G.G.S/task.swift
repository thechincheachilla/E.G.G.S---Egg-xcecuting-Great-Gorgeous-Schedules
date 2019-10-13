class task {
    // name (String) is the name of the task
    // level (Int) is the priority level
        
    var activity: String
    var level: Int
    
    init(name: String, level: Int) {
        self.activity = name
        self.level = level
    }

    init() {
        // default just in case
        self.activity = "an eggxample task"
        self.level = 0
    }
    
    func add(array: Array<task>, name: String, level: Int) -> Array<task> {
       let newTask = task(name: name, level: level)
       var newArray = array;
       
        do {
            if (array.count >= 4) {
                //throw taskErrors.tooManyEggs
            }
            newArray.append(newTask)
        }
        /*catch {
            // CHANGE THIS SO THAT ERROR IS DISPLAYED
            // also imma have you handle the error soz
            print("You have too many eggs -- max 4 per priority level")
        }
        */
        return newArray
        
    }
    public var description: String {
        var levelS : String = ""
        if level == 0 {
            levelS = "Low"
        }
        else if level == 1 {
            levelS = "Medium"
        }
        else if level == 2 {
            levelS = "High"
        }
        else if level == 3 {
            levelS = "First Priority!"
        }
        return "Activity: \(activity), Priority Level: \(levelS)"
    }
}

enum taskErrors: Error {
    case tooManyEggs
    case noEggs
}
    
