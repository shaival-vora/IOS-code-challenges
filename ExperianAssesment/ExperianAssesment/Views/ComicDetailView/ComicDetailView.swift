//
//  ComicDetailView.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import SwiftUI

struct ComicDetailView: View {
    @Binding var comicNumber: String
    @StateObject private var viewModel = ComicDetailViewModel(service: XkcdComicService())
    
    var body: some View {
        
        VStack(alignment: .center,
               spacing: 16) {
            switch viewModel.state {
            case .success(let data, let imageData):
                
                Text(data.title)
                    .font(.title)
                    .padding()
                
                if let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                Text(data.fromattedDate)
                    .font(.title2)
                    .padding()
                
                Spacer()
            case .loading:
                ProgressView()
            default:
                EmptyView()
                
            }
        }
        .task {
            await viewModel.getComicDetails(comicNumber: comicNumber)
        }
    }
}


#Preview {
    ComicDetailView(comicNumber: .constant("1"))
}
