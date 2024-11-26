import Foundation
// Welcome message and introduction
print("Welcome to the Eagle Crest Phase 3 Entry Logging System!")
print("This program allows security guards to log residents and guests entering the compound.")
// Data structure to store resident IDs
var residents: [String] = []
// Data structure to store entries (residents and guests)
var logEntries: [(id: String, isGuest: Bool, timestamp: Date)] = []

// Function to log a guest entry
func logGuestEntry() {
    logEntries.append((id: "Guest", isGuest: true, timestamp: Date()))
    print("Guest entry logged successfully.")
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


