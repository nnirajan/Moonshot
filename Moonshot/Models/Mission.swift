//
//  Mission.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let crew: [Crew]
    let description: String
    let launchDate: Date?
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

struct Crew: Codable {
    let name, role: String
}
