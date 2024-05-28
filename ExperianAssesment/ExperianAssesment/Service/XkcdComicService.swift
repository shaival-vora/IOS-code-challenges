//
//  XkcdComicService.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import Foundation

// Network Service Structure: It promotes a clean separation of concerns by isolating networking code from SwiftUI views and view models, thus improving code readability, maintainability, and testability.
///  - XkcdComicService class makes the API call to get the details about the Xkcd comics and it also make a network call to fetch the image data from a given
struct XkcdComicService {
    enum ComicServiceError: Error {
        case failed
        case failedToDecode
        case invalidStatusCode
    }
    
    func fetchComicData(comicNumber: String) async throws -> XkcdComicModel {
        //Step1 create url
        var defaultUrlString: String = "https://xkcd.com/info.0.json"
        if let comicNumber = Int(comicNumber),
           comicNumber > 0 && comicNumber <= 2843 {
            defaultUrlString = "https://xkcd.com/\(comicNumber)/info.0.json"
        }
        guard let comicDataUrl = URL(string: defaultUrlString) else {
            throw ComicServiceError.failed
        }
        // Fetch the data from the API
        let (data, response) = try await URLSession.shared.data(from: comicDataUrl)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ComicServiceError.invalidStatusCode
        }
        
        // decode the data using JSON decoder
        if let decodedResponse = try? JSONDecoder().decode(XkcdComicModel.self, from: data) {
            return  decodedResponse
        } else {
            throw ComicServiceError.failedToDecode
        }
    }
    
    func fetchImage(imageUrlString: String) async throws -> Data {
        // Step 1 create a URL
        guard let imageURL = URL(string: imageUrlString) else {
            throw ComicServiceError.failed
        }
        
        let (data, response) = try await URLSession.shared.data(from: imageURL)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ComicServiceError.invalidStatusCode
        }
        
        return data
        
    }
    
}
