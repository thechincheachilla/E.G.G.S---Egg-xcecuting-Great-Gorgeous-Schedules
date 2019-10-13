/*
    task class: Creates an object meant to be stored in an
    array that contains information on the activity String
    passed in by the user and the associated priority level.
*/

class task {
        
    var activity: String    // User input String
    var level: Int          // Priority level of the activity
    
    // Constructor: Sets passed in user parameters to the
    // activity and priority level.
    init(name: String, level: Int) {
        self.activity = name
        self.level = level
    }

    // Default constructor just in case
    init() {
        self.activity = "an eggxample task"
        self.level = 0
    }
    
    /*
        add method: appends the input task array with a user input
        activity string and priority level, returns a new appended
        task array.
    */
    func add(array: Array<task>, name: String, level: Int) -> Array<task> {
        let newTask = task(name: name, level: level)
        var newArray = array;
       
        // do/catch removed, implementation irrelevant.
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
    
    /*
        description: Effectively the "toString" method of this
        task class. Converts priority level ints to worded Strings,
        returns the activity and associated priority level.
    */
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

// taskErrors: implementation unecessary
/*
enum taskErrors: Error {
    case tooManyEggs
    case noEggs
}
*/
    
