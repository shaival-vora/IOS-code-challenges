//
//  FilledSubmitButton.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import SwiftUI
/// -  FilledSubmitButton is a single button view \
/// - Parameters: 
/// - title: Button Title
/// - padding:  padding around the button title string
/// - backgroundColor:  background color of the button
/// - titleColor: button title color
/// - comicNumber: It's a binding so it get's the value of the comic number from the main content view
/// - submitButtonClick: passing a Closure on button click action
struct FilledSubmitButton: View {
    var title: String
    var padding: EdgeInsets
    var backgroundColor: Color
    var titleColor: Color
    @Binding var comicNumber: String
    var submitButtonClick: (()->Void)?
    
    var body: some View {
        Button(action: {
            //Move to the Display screen
            if comicNumber.isEmpty {
                comicNumber = "1"
            }
          submitButtonClick?()

        },label: {
            Text(title)
        })
        .padding(padding)
        .background(backgroundColor)
        .foregroundColor(titleColor)
        .clipShape(.buttonBorder)
    }
}
