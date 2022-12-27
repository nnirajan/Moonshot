//
//  MissionDetailViewModel.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import Foundation
import Combine

class MissionDetailViewModel: BaseViewModel {
    // MARK: properties
    var mission: Mission
    
    @Published var crewMember = [CrewMember]()
    
    // MARK: initialization
    init(mission: Mission) {
        self.mission = mission
  
        let astronauts: [String: Astronaut] = Bundle.main.decode(.astronauts)
        
        self.crewMember = mission.crew.map({ crew in
            if let astronaut = astronauts[crew.name] {
                return CrewMember(role: crew.role, astronaut: astronaut)
            } else {
                fatalError("Mission \(crew.name)")
            }
        })
    }
}
