//
//  CommonStrings.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import Foundation

// This File contains all the string used in the app
/// - 'CommonStrings' enum file, which serves as a centralized place for all the commonly used strings across the application.
/// - Usage: Developers can access these strings throughout the application by referencing the appropriate nested enum and accessing the string from rawValue
enum CommonString {
    
    enum InputScreen: String {
        case navigationTitle = "XKCD Comics"
        case comicNumberInputLabel = "Enter your comic number"
        case comicNumberTFPlaceHolder = "Enter the Input Integer"
        case submitButton = "Submit"
        case comicDetailViewNavPath = "ComicDetailViewPath"
        
        var value: String {
            return self.rawValue
        }
    }
}

enum DisplayErrorMessage: String {
    case emptyInput = "Please enter a number. Default input number 1 will be used if the input is empty."
    case invalidInput = "Enter a interger input between 1 and 2843"
    
    var error: String {
        return self.rawValue
    }
    
}

