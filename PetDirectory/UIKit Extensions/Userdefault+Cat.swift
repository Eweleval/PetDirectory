//
//  StorageManager.swift
//  PetDirectory
//
//  Created by Decagon on 04/07/2022.
//

import Foundation

enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object"
    case noValue = "No object found"
    case unableToDecode = "Unable to decode data"
    case unableToUpdate = "Unable to update data with new value"

    var errorDescription: String? {
        rawValue
    }
}

protocol ObjectSavable {
    func saveObject<Object>(_ objects: [Object], forKey key: String) throws where Object: Encodable
    func getObject<Object>(forKey key: String, castTo type: [Object].Type) throws -> [Object] where Object: Decodable
}

extension UserDefaults: ObjectSavable {
    func saveObject<Object>(
        _ objects: [Object],
        forKey key: String) throws where Object : Encodable {
            let encoder = JSONEncoder()

            do {
                let data = try encoder.encode(objects)
                set(data, forKey: key)
            } catch {
                throw ObjectSavableError.unableToEncode
            }
        }

    func getObject<Object>(
        forKey key: String,
        castTo type: [Object].Type) throws -> [Object] where Object : Decodable {
            guard let data = data(forKey: key) else {
                throw ObjectSavableError.noValue
            }
            let decoder = JSONDecoder()

            do {
                let object = try decoder.decode(type, from: data)
                return object
            } catch {
                throw ObjectSavableError.unableToDecode
            }
        }

    func updateObject<Object>(with aCat: Object, forKey key: String, castTo type: [Object].Type) throws -> [Object] where Object : Codable {
        do {
            var likedCats = try getObject(forKey: key, castTo: type)
            likedCats.append(aCat)

            try saveObject(likedCats, forKey: key)
            return likedCats

        } catch {
            throw ObjectSavableError.unableToUpdate
        }
    }
}
