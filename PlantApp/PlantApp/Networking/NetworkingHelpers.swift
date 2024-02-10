//
//  NetworkingHelpers.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation

// Enum to represent general errors that may occur during operations.

enum GeneralError : String, Error{
    case unableToComplete = "Unable to complete your request"
    case invalidResponse = "Invalid response from server"
    case invalidData = "The data recived from the server was invalid"
}

// Enum to represent the result of an operation, either success or failure.

enum Result<Success, Failure : Error>{
    case success(Success)
    case failure(Failure)
}

// Enum to represent different endpoints in the application for API calls.

enum Endpoints : String{
    case getCategories = "getCategories"
    case getQuestions = "getQuestions"
}
