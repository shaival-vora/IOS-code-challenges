//
//  ComicDetailViewModel.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import Foundation

/// - ComicDetailViewModel is the view model which handles the state and invokes the API call from the network service
/// - It uses ObservableObject: It allows the  views to observe changes made to the object's properties and react accordingly.

@MainActor
final class ComicDetailViewModel: ObservableObject {
    enum State {
        case notLoading
        case loading
        case success(data: XkcdComicModel, comicImageData: Data)
        case failed(error: Error)
    }
    
    @Published private (set) var state: State = .notLoading
    
    private let service: XkcdComicService
    
    init(service: XkcdComicService) {
        self.service = service
    }
    
    func getComicDetails(comicNumber: String) async {
        self.state = .loading
        do {
            let data = try await service.fetchComicData(comicNumber: comicNumber)
            let imageData = try await service.fetchImage(imageUrlString: data.img)
            self.state = .success(data: data, comicImageData: imageData)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
