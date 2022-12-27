//
//  Bundle+Extensions.swift
//  Moonshot
//
//  Created by ebpearls on 23/12/2022.
//

import Foundation

enum ResoucesFile: String {
    case astronauts = "astronauts.json"
    case missions = "missions.json"
}

extension Bundle {
  
    func decode<T: Codable>(_ fileName: ResoucesFile) -> T {
        let fileName = fileName.rawValue
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in the bundle.")
        }
        
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Failed to load \(fileName) from the bundle.")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) from the bundle.")
        }
        
        return decoded
    }
    
}
