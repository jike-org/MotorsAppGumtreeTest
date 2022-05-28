//
//  Constants.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import Foundation

// http://mcuapi.mocklab.io/search?make=[make]&model=[model]&year=[year]
// https://mcuapi.mocklab.io/search?make=Toyota&model=Prius&year=2020
class Constants {
    
    struct API {
        static let apiKey = ""
        static let defaultScheme = "https" // responds on https also
        static let defaultHost = "mcuapi.mocklab.io"
        static let defaultPath = "search?make=[make]&model=[model]&year=[year]"
    }
    
}
