//
//  ComicNumberTextField.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/15/24.
//

import SwiftUI

// SwiftUI TextField Struct
/// - Parameters:
/// - comicNumber: This parameter binds the TextField value to a String value
/// - showValidationErrorPrompt: This parameter controls the visibility of a validation error prompt associated with the TextField
/// - errorMessage: this parameter controls on what error message should be displayed
/// - placeholder: Contains the placeholder text for the text field
struct ComicNumberTextField: View {
    
    @Binding var comicNumber: String
    @Binding var showValidationErrorPrompt: Bool
    @Binding var errorMessage: DisplayErrorMessage
    var placeHolder: String

    var body: some View {
        
        TextField(placeHolder,
                  text: $comicNumber.onTextChange({ value in
            showValidationErrorPrompt = false
            if let comicInteger = Int(value),
               comicInteger <= 0 || comicInteger > 2843 {
                showValidationErrorPrompt = true
                errorMessage = .invalidInput
            } else if value.isEmpty {
                showValidationErrorPrompt = true
                errorMessage = .emptyInput
            }
        }))
        .keyboardType(.numberPad)
        .textFieldStyle(.roundedBorder)
        .font(.system(size: 14,
                      weight: .regular,
                      design: .default))
        
    }
}
