//
//  AstronautDetailViewModel.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import Foundation
import Combine

class AstronautDetailViewModel: BaseViewModel {

    // MARK: properties
    var astronaut: Astronaut
    
    // MARK: initialization
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
    }
    
}
