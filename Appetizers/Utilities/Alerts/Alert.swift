//
//  Alert.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: Network alerts
    static let invalidData = AlertItem(title: Text("Server error"),
                                       message: Text("The data received from the server was invalid."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server error"),
                                           message: Text("Invalid response from the server, contact the support."),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server error"),
                                      message: Text("URL is not valid, provide the valid one or connect to support."),
                                      dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server error"),
                                            message: Text("Unable to complete, please check your Internet connection."),
                                            dismissButton: .default(Text("OK")))
    
    // MARK: Account alerts

    
    static let invalidForm = AlertItem(title: Text("Invalid form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid email"),
                                            message: Text("Please ensure your email is correct."),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was successfully saved."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile."),
                                            dismissButton: .default(Text("OK")))
}

