//
//  ContentView.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/13/24.
//

import SwiftUI
import Foundation


struct ContentView: View {
    
    @State private var comicNumber: String = "1"
    @State private var path = NavigationPath()
    @State private var showValidationErrorPrompt: Bool = false
    @State private var errorMessage: DisplayErrorMessage = .invalidInput

    var body: some View {
        
        NavigationStack(path: $path) {
        VStack(spacing: 16) {
            
            HStack() {
                Label(
                    title: { Text("\(CommonString.InputScreen.comicNumberInputLabel.value): ")  },
                    icon: {   }
                )
                .font(.system(size: 16,
                              weight: .regular,
                              design: .default))
                .foregroundStyle(.black)
                .lineLimit(1)
                .layoutPriority(1)

                ComicNumberTextField(comicNumber: $comicNumber,
                                     showValidationErrorPrompt: $showValidationErrorPrompt,
                                     errorMessage: $errorMessage,
                                     placeHolder: CommonString.InputScreen.comicNumberTFPlaceHolder.value)
            }
            
            if showValidationErrorPrompt {
                Text(errorMessage.error)
                    .foregroundStyle(Color.red)
                    .font(.footnote)
                    .fontWeight(.bold)
            }
            
            FilledSubmitButton(title: CommonString.InputScreen.submitButton.value,
                               padding: EdgeInsets(top: 8,
                                                   leading: 8,
                                                   bottom: 8,
                                                   trailing: 8),
                               backgroundColor: Color.blue,
                               titleColor: Color.white,
                               comicNumber: $comicNumber,
                               submitButtonClick: {
                path.append(CommonString.InputScreen.comicDetailViewNavPath.value)
            })
            .navigationDestination(for: String.self) { view in
                if view == CommonString.InputScreen.comicDetailViewNavPath.value {
                    ComicDetailView(comicNumber: $comicNumber)
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle(CommonString.InputScreen.navigationTitle.value)
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
