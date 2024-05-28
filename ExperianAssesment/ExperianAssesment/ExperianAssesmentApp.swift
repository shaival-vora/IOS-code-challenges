//
//  ExperianAssesmentApp.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/13/24.
//

import SwiftUI

/*
 Implemented the screen using SwiftUI, ensuring a clean and minimalistic UI.
 Utilized async-await for API calls to maintain responsiveness and a smooth user experience.
 Segregated API call logic into a separate view model class and network service struct to promote code modularity and separation of concerns.
 Employed enums to manage different states, enhancing code readability and maintainability.
 Avoided the use of third-party libraries as per the technical requirements.
 Ensured all necessary project files are contained within the Xcode project for easy setup and execution.
 */

@main
struct ExperianAssesmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
