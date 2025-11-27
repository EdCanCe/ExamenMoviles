//
//  TemplateInfo.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

struct Item: Codable, Identifiable { // If it's going to be listed in an array, also add Identificable
    var name: String // These need to have the names of the variables in the json
    var id: String
}
