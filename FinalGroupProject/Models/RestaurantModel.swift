//
//  RestaurantModel.swift
//  FinalGroupProject
//
//  Created by Alexander Kudin on 2022-04-20.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String {self.rawValue}
    
    case chineese = "Chineese"
    case japaneese = "Japaneese"
    case vietnamese = "Vietnamese"
    case italian = "Italian"
    case american = "American"
    case easternEuropean = "Eastern European"
    case sushi = "Sushi"
    case burgers = "Burgers"
    case pizza = "Pizza"
    case cofee = "Cofee"
    case desserts = "Desserts"
    case other = "Other"
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var category: Category.RawValue
    var rating: Int
    var phone: String
    var street: String
    var city: String
    var province: String
    var country: String
    var postal: String
    var description: String
    var dateCreated: String
}

extension Restaurant {
    static let all: [Restaurant] = [
        Restaurant(
            name: "Test Restaurant",
            category: "Other",
            rating: 4,
            phone: "9956142000",
            street: "123 Main Street",
            city: "Toronto",
            province: "Ontario",
            country: "Canada",
            postal: "M4E2V9",
            description: "This is a superb resturant in the middle of east part of Toronto.",
            dateCreated: "2022-04-12"
        ),
        Restaurant(
            name: "Steak House on Church",
            category: "American",
            rating: 5,
            phone: "9956142000",
            street: "123 Church Street",
            city: "Toronto",
            province: "Ontario",
            country: "Canada",
            postal: "M9N1N6",
            description: "This is a superb resturant in the middle of east part of Toronto.",
            dateCreated: "2022-04-12"
        ),
    ]
}

