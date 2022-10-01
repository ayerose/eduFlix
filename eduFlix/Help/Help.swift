//
//  Help.swift
//  eduFlix
//
//  Created by Soreya Koura on 28.04.22.
//

import Foundation


struct Help: Decodable {
    let text: String
    let children: [Help]?
    
    
    
}
