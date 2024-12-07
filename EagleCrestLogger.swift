import Foundation
// Welcome message and introduction
print("Welcome to the Eagle Crest Phase 3 Entry Logging System!")
print("This program allows security guards to log residents and guests entering the compound.")

// Data structure to store resident IDs
var residents: Set<String> = []

// Data structure to store entries (residents and guests)
var logEntries: [(id: String, isGuest: Bool, timestamp: Date)] = []

// Function to log a guest entry
func logGuestEntry() {
    let uniqueGuestID = "Guest-\(UUID().uuidString)"
    logEntries.append((id: uniqueGuestID, isGuest: true, timestamp: Date()))
    print("Guest entry logged successfully with ID\(uniqueGuestID)")
}

// Function to log a resident entry
func logResidentEntry() {
    print("Enter Resident ID to log entry:", terminator: "")
    if let residentID = readLine(), ! residentID.trimmingCharacters(in:.whitespacesandNewlines).isEmpty {
        if residents.contains(residentID) {
            logEntries.append((id: residentID, isGuest: false, timestamp: Date()))
            print("Entry logged for Resident \(residentID).")
        } else {
            print("Resident ID not found. Please register the resident first.")
        }
    } else {
        print("Invalid input. Please try again.")
    }
}


// Function to register a new resident
func registerResident() {
    print("Enter Resident ID to register:", terminator: "")
    if let residentID = readLine() {
        if !residents.contains(residentID) {
            residents.append(residentID)
            print("Resident \(residentID) registered successfully.")
        } else {
            print("Resident \(residentID) is already registered.")
        }
    } else {
        print("Invalid input. Please try again.")
    }
}

// Function to remove a resident
func removeResident() {
    print("Enter Resident ID to remove:", terminator: "")
    if let residentID = readLine(), !residentID.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
        if residents.contains(residentID) {
            print("Are you sure you want to remove Resident \(residentID)? (yes/no):", terminator: " ")
            if let confirmation = readLine(), confirmation.lowercased() == "yes" {
               residents.remove(residentID)
               print("Resident \(residentID) removed successfully.")
            } else {
                print("Operation canceled.")
            }
        } else {
            print("Resident ID not found. Please try again.")
        }
    } else {
        print("Invalid input. Please try again.")
    }
}

// Function to display logged entries
func viewLogs() {
    if logEntries.isEmpty {
        print("No entries logged yet.")
    } else {
        print("Logged Entries:")
        for (index, entry) in logEntries.enumerated() {
            let type = entry.isGuest ? "Guest" : "Resident"
            let formattedDate = DateFormatter.localizedString(from: entry.timestamp, dateStyle: .short, timeStyle: .short)
            print("\(index + 1). ID: \(entry.id), Type: \(type), Timestamp: \(formattedDate)")
        }
    }
}

// Function to save logs to a file
func saveLogsToFile() {
    let fileName = "logEntries.txt"
    let filePath = FileManager.default.currentDirectoryPath + "/" + fileName
    var fileContent = "Log Entries:\n"
    
    for entry in logEntries {
        let type = entry.isGuest ? "Guest" : "Resident"
        let formattedDate = DateFormatter.localizedString(from: entry.timestamp, dateStyle: .short, timeStyle: .short)
        fileContent += "ID: \(entry.id), Type: \(type), Timestamp: \(formattedDate)\n"
    }
    
    do {
        try fileContent.write(toFile: filePath, atomically: true, encoding: .utf8)
        print("Logs saved to \(filePath).")
    } catch {
        print("Failed to save logs: \(error.localizedDescription)")
    }
}

// Main program loop until a valid choice is made
func start() {
while true {
    // Display menu options
    print("\nTo get started, enter a number to access a feature:")
    print("1. Register a Resident")
    print("2. Remove a Resident")
    print("3. Log a Resident Entry")
    print("4. Log a Guest Entry")
    print("5. View Logs")
    print("6. Save Logs to File")
    print("7. Exit")

    // Reading user input
        if let userInput = readLine(), let option = Int(userInput) {
            switch option {
            case 1:
                print("You chose to register a new resident.")
                registerResident()
            case 2:
                print("You chose to remove a resident.")
                removeResident()
            case 3:
                print("You chose to log a resident entry.")
                logResidentEntry()
            case 4:
                print("You chose to log a guest entry.")
                logGuestEntry()
            case 5:
                print("You chose to view logs.")
                viewLogs()
            case 6:
                print("You chose to save logs to a file.")
                saveLogsToFile()
            case 7:
                print("Exiting the program. Goodbye!")
                return
            default:
                print("Invalid option. Please enter a number from 1 to 7.")
            }
        } else {
            print("Invalid input. Please enter a valid number.")
    }
}
}


