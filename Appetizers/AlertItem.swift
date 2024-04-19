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
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("The data received from server was invalid."))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please try again later or contact support."))
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. Invalid data returned."))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check again later."))
    
}
