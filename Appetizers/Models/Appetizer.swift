//
//  Appetizer.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import Foundation

struct Appetizer: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let carbs: Int
    let protein: Int
    let calories: Int
    let price: Double
    
}

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0, name: "Test apptezier", description: "Just any long and tedius description. Ohhhhh asd dafasf sdfas asdfasd.", imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", carbs: 1, protein: 2, calories: 3, price: 66.60)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
