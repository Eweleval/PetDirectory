//
//  CatModel.swift
//  PetDirectory
//
//  Created by Decagon on 01/07/2022.
//

import Foundation

// MARK: - CatModel (Model For The JsonData)
struct CatModel: Codable {
    let image: Image?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
    }
}

// MARK: - Image
struct Image: Codable {
    let url: String?
}
