//
//  AlertItem.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AlertItem: Equatable {
    let id = UUID()
    let title: Text
    let message: Text
}

struct AlertContext {
    //MARK: - Network error messages
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("The data received from server was invalid."))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again later or contact support."))
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. Invalid data returned."))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check again later."))
    
    //MARK: - Account error messages
    static let emptyField = AlertItem(title: Text("Empty Field"),
                                            message: Text("Please, ensure all fields in the form have been filled out."))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please, ensure your e-mail is correct."))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                            message: Text("Your profile information was successfully saved."))
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                            message: Text("There was an error saving or retrieving your profile."))
    
}
