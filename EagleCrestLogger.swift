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

// Flag to control the loop
var isValidChoice = false
// Main program loop until a valid choice is made
while !isValidChoice {
    // Display menu options
    print("\nTo get started, enter a number to access a feature:")
    print("1. Register a Resident")
    print("2. Remove a Resident")
    print("3. Log a Resident Entry")
    print("4. Log a Guest Entry")
    print("5. Exit")
    // Reading user input
    if let userInput = readLine(), let option = Int(userInput) {
        switch option {
        case 1:
            print("You chose to register a new resident.")
            registerResident() // Register a resident
        case 2:
            print("You chose to remove a resident.")
            removeResident() // Remove a resident
        case 3:
            print("You chose to log a resident entry.")
            logResidentEntry() // Log a resident entry
        case 4:
            print("You chose to log a guest entry.")
            logGuestEntry() // Log a guest entry
        case 5:
            print("Exiting the program. Goodbye!")
            isValidChoice = true // Break the loop to exit the program
        default:
            print("Invalid option. Please enter a number from 1 to 5.")
        }
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}



