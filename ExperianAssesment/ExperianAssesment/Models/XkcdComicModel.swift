//
//  XkcdComicModel.swift
//  ExperianAssesment
//
//  Created by Shaival Vora on 2/14/24.
//

import Foundation

/// This is the data model for XKCD comics api
/// - This conforms to the Codable Protocol which is the typeAlias for Decodable and Encodable protocols
struct XkcdComicModel: Codable {
    var title: String
    var img: String
    var year: String
    var month: String
    var day: String
    
    var fromattedDate: String {
        return "\(day)/\(month)/\(year)"
    }
}
