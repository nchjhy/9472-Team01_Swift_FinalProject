import Foundation
// Welcome message and introduction
print("Welcome to the Eagle Crest Phase 3 Entry Logging System!")
print("This program allows security guards to log residents and guests entering the compound.")
// Data structure to store resident IDs
var residents: [String] = []
// Data structure to store entries (residents and guests)
var logEntries: [(id: String, isGuest: Bool, timestamp: Date)] = []
