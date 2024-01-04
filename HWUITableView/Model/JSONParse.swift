//
//  JSON.swift
//  HWUITableView
//
//  Created by Карина Дьячина on 4.01.24.
//

import Foundation
enum ParseError: Error {
    case fileNotFound
    case convertDataFromJSON
}

final class LocalJSONParser {
    static func readLocalJSONFile(forName name: String) throws -> Data {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json")  else {
            throw ParseError.fileNotFound
        }
        let fileURL = URL(fileURLWithPath: filePath)
        do {
            return try Data(contentsOf: fileURL)
        } catch {
            throw ParseError.convertDataFromJSON
        }
    }
    
    static func parse(jsonData: Data) -> [Language]? {
        do {
            let decodedData = try JSONDecoder().decode([Language].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
