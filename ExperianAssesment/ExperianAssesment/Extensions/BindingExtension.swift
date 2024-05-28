//
//  BindingExtension.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import SwiftUI


/// - Added onTextChange functionality to the Binding by creating a extension
/// - This Extension will send back a escaping closure on the user's text input
/// - This will help to check and notify on every user input
extension Binding {
    func onTextChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
